//
//  CameraViewController.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 18/06/26.
//

import UIKit
import AVFoundation
import SwiftUI
import CoreML
import Vision

final class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {

    var onPredictionUpdate: ((String, Double) -> Void)?
    var onHandPointsUpdate: (([VNHumanHandPoseObservation.JointName: CGPoint]) -> Void)?

    private let session = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private var previewLayer: AVCaptureVideoPreviewLayer!

    private let visionQueue = DispatchQueue(label: "vision.queue")
    private var model: MLModel?

    private let validLabels: Set<String> = [
        "A","B","C","D","E","F","G","H","I","J","K","L","M",
        "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"
    ]

    private let confidenceThreshold: Double = 0.35

    private let pointKeys: [VNHumanHandPoseObservation.JointName] = [
        .wrist,
        .thumbCMC, .thumbMP, .thumbIP, .thumbTip,
        .indexMCP, .indexPIP, .indexDIP, .indexTip,
        .middleMCP, .middlePIP, .middleDIP, .middleTip,
        .ringMCP, .ringPIP, .ringDIP, .ringTip,
        .littleMCP, .littlePIP, .littleDIP, .littleTip
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadModel()
        setupCamera()
    }

    private func setupCamera() {
        session.sessionPreset = .high

        guard let camera = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .front
        ),
        let input = try? AVCaptureDeviceInput(device: camera) else {
            return
        }

        if session.canAddInput(input) {
            session.addInput(input)
        }

        videoOutput.setSampleBufferDelegate(self, queue: visionQueue)
        videoOutput.alwaysDiscardsLateVideoFrames = true

        if session.canAddOutput(videoOutput) {
            session.addOutput(videoOutput)
        }

        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.insertSublayer(previewLayer, at: 0)

        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer?.frame = view.bounds
    }

    private func loadModel() {
        guard let url = Bundle.main.url(
            forResource: "SIBIClassifierComplete",
            withExtension: "mlmodelc"
        ) else {
            return
        }

        do {
            model = try MLModel(contentsOf: url)
        } catch {
            print("Failed to load model:", error)
        }
    }

    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {
            return
        }

        let request = VNDetectHumanHandPoseRequest()
        request.maximumHandCount = 1

        let handler = VNImageRequestHandler(
            cvPixelBuffer: pixelBuffer,
            orientation: .leftMirrored,
            options: [:]
        )

        do {
            try handler.perform([request])

            guard let observation = request.results?.first else {
                DispatchQueue.main.async {
                    self.onPredictionUpdate?("—", 0)
                    self.onHandPointsUpdate?([:])
                }
                return
            }
            let points = makeHandPoints(from: observation)

            DispatchQueue.main.async {
                self.onHandPointsUpdate?(points)
            }

            let features = makeFeatures(from: observation)
            predict(features: features)

        } catch {
            DispatchQueue.main.async {
                self.onPredictionUpdate?("—", 0)
            }
        }
    }
    
    private func makeHandPoints(
        from observation: VNHumanHandPoseObservation
    ) -> [VNHumanHandPoseObservation.JointName: CGPoint] {
        var points: [VNHumanHandPoseObservation.JointName: CGPoint] = [:]

        for key in pointKeys {
            if let point = try? observation.recognizedPoint(key),
               point.confidence > 0.2 {
                points[key] = point.location
            }
        }

        return points
    }

    private func makeFeatures(
        from observation: VNHumanHandPoseObservation
    ) -> [String: MLFeatureValue] {
        var dict: [String: MLFeatureValue] = [:]

        for key in pointKeys {
            let baseName = featureBaseName(for: key)

            if let point = try? observation.recognizedPoint(key),
               point.confidence > 0.2 {
                dict["\(baseName)_x"] = MLFeatureValue(double: Double(point.location.x))
                dict["\(baseName)_y"] = MLFeatureValue(double: Double(point.location.y))
                dict["\(baseName)_confidence"] = MLFeatureValue(double: Double(point.confidence))
            } else {
                dict["\(baseName)_x"] = MLFeatureValue(double: 0)
                dict["\(baseName)_y"] = MLFeatureValue(double: 0)
                dict["\(baseName)_confidence"] = MLFeatureValue(double: 0)
            }
        }

        return dict
    }

    private func featureBaseName(
        for key: VNHumanHandPoseObservation.JointName
    ) -> String {
        String(describing: key)
            .replacingOccurrences(of: ".", with: "_")
    }

    private func predict(features: [String: MLFeatureValue]) {
        guard let model else { return }

        do {
            let provider = try MLDictionaryFeatureProvider(dictionary: features)
            let output = try model.prediction(from: provider)

            let predictionText = readPredictedLabel(from: output) ?? "?"
            let confidence = readConfidence(for: predictionText, from: output) ?? 0

            DispatchQueue.main.async {
                guard self.validLabels.contains(predictionText),
                      confidence >= self.confidenceThreshold else {
                    self.onPredictionUpdate?("?", confidence)
                    return
                }

                self.onPredictionUpdate?(predictionText, confidence)
            }

        } catch {
            DispatchQueue.main.async {
                self.onPredictionUpdate?("?", 0)
            }
        }
    }

    private func readPredictedLabel(from output: MLFeatureProvider) -> String? {
        let possibleNames = ["label", "classLabel", "target", "Label"]

        for name in possibleNames {
            if let value = output.featureValue(for: name)?.stringValue {
                return value
            }
        }

        for name in output.featureNames {
            if let value = output.featureValue(for: name)?.stringValue {
                return value
            }
        }

        return nil
    }

    private func readConfidence(
        for label: String?,
        from output: MLFeatureProvider
    ) -> Double? {
        guard let label else { return nil }

        for name in output.featureNames {
            if let dict = output.featureValue(for: name)?.dictionaryValue {
                for (key, value) in dict {
                    if String(describing: key) == label {
                        return value.doubleValue
                    }
                }
            }
        }

        return nil
    }
}

struct CameraView: UIViewControllerRepresentable {
    @Binding var prediction: String
    @Binding var confidence: Double
    @Binding var handPoints: [VNHumanHandPoseObservation.JointName: CGPoint]
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let controller = CameraViewController()

        controller.onPredictionUpdate = { prediction, confidence in
            self.prediction = prediction
            self.confidence = confidence
        }

        controller.onHandPointsUpdate = { points in
            self.handPoints = points
        }

        return controller
    }
    
    func updateUIViewController(
        _ uiViewController: CameraViewController,
        context: Context
    ) {}
}

#Preview {
    CameraView(prediction: .constant("A"), confidence: .constant(0.0), handPoints: .constant([:]))
        .ignoresSafeArea()
}
