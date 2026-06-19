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
    
    private let session = AVCaptureSession()
    private let videoOutput = AVCaptureVideoDataOutput()
    private var previewLayer: AVCaptureVideoPreviewLayer!
    
    private let visionQueue = DispatchQueue(label: "vision.queue")
    private var model: MLModel?
    
    private let titleLabel = UILabel()
    private let titleTopLabel = UILabel()
    private let confidenceIcon = UIImageView()
    private let liveConfidenceLabel = UILabel()
    private let badgeView = UIView()
    
    
    private let predictionLabel = UILabel()
    private let confidenceTopLabel = UILabel()
    private let confidenceLabel = UILabel()
    private let statusLabel = UILabel()
    private let classifiedConfidenceLabel = UILabel()
    private let confidenceLevelProgressBar = UIProgressView()
    private let progressContainer = UIView()
    
    
    private let validLabels: Set<String> = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    private let confidenceThreshold: Double = 0.55
    private var confidence: Double? = 0.0
    private var predictionText: String? = ""
    private let labelTest = UILabel()
    private var handHostingController: UIHostingController<AnyView>?

    private var handView = HandFullHelper(fillShape: ShapeFactory.filled(for: "A"), outlineShape: ShapeFactory.outline(for: "A"), width: 70, height: 70, lineWidth: 0.3)
    
    
    private let pointKeys: [VNHumanHandPoseObservation.JointName] = [
        .wrist,
        .thumbCMC, .thumbMP, .thumbIP, .thumbTip,
        .indexMCP, .indexPIP, .indexDIP, .indexTip,
        .middleMCP, .middlePIP, .middleDIP, .middleTip,
        .ringMCP, .ringPIP, .ringDIP, .ringTip,
        .littleMCP, .littlePIP, .littleDIP, .littleTip
    ]
    
    private func makeHandView(letter: String) -> AnyView {
        AnyView(
            HandFullHelper(
                fillShape: ShapeFactory.filled(for: letter),
                outlineShape: ShapeFactory.outline(for: letter),
                width: 70,
                height: 70,
                lineWidth: 0.3
            )
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTopUI()
        loadModel()
        setupCamera()
    }
    
    private func loadModel() {
        guard let url = Bundle.main.url(
            forResource: "SIBIClassifierComplete",
            withExtension: "mlmodelc"
        ) else {
            statusLabel.text = "Add SIBIClassifier Test.mlmodel to Xcode"
            return
        }
        
        do {
            model = try MLModel(contentsOf: url)
            statusLabel.text = "Model loaded — show hand"
        } catch {
            statusLabel.text = "Failed to load model"
        }
    }
    
    private func setupCamera() {
        session.sessionPreset = .high
        
        guard let camera = AVCaptureDevice.default(
            .builtInWideAngleCamera,
            for: .video,
            position: .front
        ),
              let input = try? AVCaptureDeviceInput(device: camera) else {
            statusLabel.text = "Camera unavailable"
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
    
    private func setupTopUI() {
        titleTopLabel.text = "SIGN"
        titleTopLabel.textColor = .lightPurple
        titleTopLabel.font = .systemFont(ofSize: 14, weight: .bold)
        titleTopLabel.textAlignment = .center

        let hostingController = UIHostingController(
            rootView: makeHandView(letter: "A")
        )

        self.handHostingController = hostingController

        addChild(hostingController)

        let handUIView = hostingController.view!
        handUIView.backgroundColor = .clear
        handUIView.translatesAutoresizingMaskIntoConstraints = false

        let panel = UIStackView(arrangedSubviews: [
            titleTopLabel,
            handUIView
        ])

        panel.axis = .vertical
        panel.spacing = 16
        panel.alignment = .center
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = .whiteBackground
        panel.layer.cornerRadius = 24
        panel.layer.borderWidth = 2
        panel.layer.borderColor = UIColor.lightPurple.cgColor
        panel.isLayoutMarginsRelativeArrangement = true
        panel.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

        view.addSubview(panel)

        NSLayoutConstraint.activate([
            panel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            panel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            panel.widthAnchor.constraint(equalToConstant: 130),
            panel.heightAnchor.constraint(equalToConstant: 160),

        ])

        hostingController.didMove(toParent: self)
    }
    private func setupUI() {
        view.backgroundColor = .black
        
        titleLabel.text = "DETECTED SIGN"
        titleLabel.textColor = .lightPurple
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        confidenceIcon.image = UIImage(systemName: "checkmark.circle.fill")
        confidenceIcon.tintColor = .lightPurple
        confidenceIcon.contentMode = .scaleAspectFit
        
        liveConfidenceLabel.text = "Live Confidence"
        liveConfidenceLabel.font = .systemFont(ofSize: 16, weight: .regular)
        liveConfidenceLabel.textColor = .lightPurple
        
        predictionLabel.text = "—"
        predictionLabel.textColor = .whitePurple
        predictionLabel.font = .boldSystemFont(ofSize: 42)
        predictionLabel.textAlignment = .center
        predictionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        badgeView.backgroundColor = .lightPurple
        badgeView.layer.cornerRadius = 18
        badgeView.clipsToBounds = true
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.addSubview(predictionLabel)
        
        confidenceLabel.text = "..% Confidence"
        confidenceLabel.textColor = .label
        confidenceLabel.font = .systemFont(ofSize: 16)
        confidenceLabel.textAlignment = .left
        
        classifiedConfidenceLabel.text = "Medium"
        classifiedConfidenceLabel.textColor = .lightPurple
        classifiedConfidenceLabel.font = .systemFont(ofSize: 16)
        classifiedConfidenceLabel.textAlignment = .right
        
        if let confidence = self.confidence {
            confidenceLevelProgressBar.progress = Float(confidence)
        }
        confidenceLevelProgressBar.progress = 0.0
        confidenceLevelProgressBar.progressTintColor = .lightPurple
        confidenceLevelProgressBar.trackTintColor = .systemGray5
        confidenceLevelProgressBar.translatesAutoresizingMaskIntoConstraints = false
        
        progressContainer.translatesAutoresizingMaskIntoConstraints = false
        progressContainer.addSubview(confidenceLevelProgressBar)
        
        let horizontalTopPanel = UIStackView(arrangedSubviews: [
            titleLabel,
            UIView(),
            confidenceIcon,
            liveConfidenceLabel
        ])
        horizontalTopPanel.axis = .horizontal
        horizontalTopPanel.spacing = 8
        horizontalTopPanel.alignment = .center
        
        let confidenceTextRow = UIStackView(arrangedSubviews: [
            confidenceLabel,
            UIView(),
            classifiedConfidenceLabel
        ])
        confidenceTextRow.axis = .horizontal
        confidenceTextRow.spacing = 12
        confidenceTextRow.alignment = .center
        
        let rightSideStack = UIStackView(arrangedSubviews: [
            confidenceTextRow,
            progressContainer
        ])
        rightSideStack.axis = .vertical
        rightSideStack.spacing = 12
        rightSideStack.alignment = .fill
        
        let horizontalConfidencePanel = UIStackView(arrangedSubviews: [
            badgeView,
            rightSideStack
        ])
        horizontalConfidencePanel.axis = .horizontal
        horizontalConfidencePanel.spacing = 24
        horizontalConfidencePanel.alignment = .center
        
        
        
        let panel = UIStackView(arrangedSubviews: [
            horizontalTopPanel,
            horizontalConfidencePanel
        ])
        let outerPanel = UIStackView(arrangedSubviews: [
            UIView(),
            UIView(),
            labelTest
            
        ])
        panel.axis = .vertical
        panel.spacing = 24
        panel.alignment = .fill
        panel.translatesAutoresizingMaskIntoConstraints = false
        panel.backgroundColor = .whiteBackground
        panel.layer.cornerRadius = 24
        panel.layer.borderWidth = 2
        panel.layer.borderColor = UIColor.lightPurple.cgColor
        panel.isLayoutMarginsRelativeArrangement = true
        panel.layoutMargins = UIEdgeInsets(top: 28, left: 28, bottom: 28, right: 28)
        
        
        outerPanel.axis = .vertical
        outerPanel.backgroundColor = .whitePurple
        outerPanel.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        outerPanel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(outerPanel)
        view.addSubview(panel)
        
        NSLayoutConstraint.activate([
            panel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            panel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            panel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            
            outerPanel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            outerPanel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            outerPanel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            outerPanel.topAnchor.constraint(equalTo: panel.topAnchor, constant: -16),
            
            confidenceIcon.widthAnchor.constraint(equalToConstant: 20),
            confidenceIcon.heightAnchor.constraint(equalToConstant: 20),
            
            badgeView.widthAnchor.constraint(equalToConstant: 88),
            badgeView.heightAnchor.constraint(equalToConstant: 88),
            
            predictionLabel.centerXAnchor.constraint(equalTo: badgeView.centerXAnchor),
            predictionLabel.centerYAnchor.constraint(equalTo: badgeView.centerYAnchor),
            
            progressContainer.heightAnchor.constraint(equalToConstant: 12),
            
            confidenceLevelProgressBar.leadingAnchor.constraint(equalTo: progressContainer.leadingAnchor),
            confidenceLevelProgressBar.trailingAnchor.constraint(equalTo: progressContainer.trailingAnchor),
            confidenceLevelProgressBar.centerYAnchor.constraint(equalTo: progressContainer.centerYAnchor),
            confidenceLevelProgressBar.heightAnchor.constraint(equalToConstant: 6)
        ])
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        previewLayer?.frame = view.bounds
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
                    self.predictionLabel.text = "—"
                    self.statusLabel.text = "No hand detected"
                }
                return
            }
            
            let features = makeFeatures(from: observation)
            predict(features: features)
            
        } catch {
            DispatchQueue.main.async {
                self.statusLabel.text = "Vision error"
            }
        }
    }
    
    private func makeFeatures(
        from observation: VNHumanHandPoseObservation
    ) -> [String: MLFeatureValue] {
        var dict: [String: MLFeatureValue] = [:]
        
        for key in pointKeys {
            let baseName = featureBaseName(for: key)
            
            if let point = try? observation.recognizedPoint(key),
               point.confidence > 0.2 {
                dict["\(baseName)_x"] = MLFeatureValue(
                    double: Double(point.location.x)
                )
                dict["\(baseName)_y"] = MLFeatureValue(
                    double: Double(point.location.y)
                )
                dict["\(baseName)_confidence"] = MLFeatureValue(
                    double: Double(point.confidence)
                )
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
        return String(describing: key)
            .replacingOccurrences(of: ".", with: "_")
    }
    
    private func predict(features: [String: MLFeatureValue]) {
        guard let model = model else { return }
        
        do {
            let provider = try MLDictionaryFeatureProvider(dictionary: features)
            let output = try model.prediction(from: provider)
            
            self.predictionText = readPredictedLabel(from: output)
            self.confidence = readConfidence(for: predictionText, from: output)
            
            DispatchQueue.main.async {
                guard let predictionText = self.predictionText,
                      self.validLabels.contains(predictionText) else {
                        self.predictionLabel.text = "?"
                        self.confidenceLabel.text = "Unknown"
                        self.statusLabel.text = "Only A–Z model is active"
        
                        return
                }
                Task { @MainActor in
                    try? await Task.sleep(nanoseconds: 1_000_000_000)
                    self.handHostingController?.rootView = AnyView(HandFullHelper(fillShape: ShapeFactory.filled(for: predictionText), outlineShape: ShapeFactory.outline(for: predictionText), width: 70, height: 70, lineWidth: 0.3))
                }
                
                
                
                let confidenceValue = self.confidence ?? 0.0
                
                guard confidenceValue >= self.confidenceThreshold else {
                    self.predictionLabel.text = "?"
                    self.confidenceLabel.text = String(
                        format: "%.1f%% Confidence",
                        confidenceValue * 100
                    )
                    self.statusLabel.text = "Not confident"
                    return
                }
                
                self.predictionLabel.text = predictionText
                self.confidenceLabel.text = String(
                    format: "%.1f%% Confidence",
                    confidenceValue * 100
                )
                self.confidenceLevelProgressBar.progress = Float(confidenceValue)
                
                switch confidenceValue {
                case ..<0.5:
                    self.classifiedConfidenceLabel.text = "Low"
                case 0.5..<0.75:
                    self.classifiedConfidenceLabel.text = "Medium"
                case 0.75...:
                    self.classifiedConfidenceLabel.text = "High"
                default:
                    self.classifiedConfidenceLabel.text = ""
                }
            }
            
        } catch {
            DispatchQueue.main.async {
                self.statusLabel.text = "Prediction error: check CSV column names"
            }
        }
    }
    
    private func readPredictedLabel(from output: MLFeatureProvider) -> String? {
        let possibleNames = [
            "label",
            "classLabel",
            "target",
            "Label"
        ]
        
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
        guard let label = label else { return nil }
        
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
    func makeUIViewController(context: Context) -> CameraViewController {
        CameraViewController()
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
}

#Preview {
    CameraView()
        .ignoresSafeArea()
}
