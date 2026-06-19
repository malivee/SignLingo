//
//  HandPoseOverlayView.swift
//  SignLingo
//
//  Created by Muhammad Alief Rahman Fardillah on 19/06/26.
//

import SwiftUI
import Vision

struct HandPoseOverlayView: View {
    let points: [VNHumanHandPoseObservation.JointName: CGPoint]

    private let connections: [(VNHumanHandPoseObservation.JointName, VNHumanHandPoseObservation.JointName)] = [
        (.wrist, .thumbCMC), (.thumbCMC, .thumbMP), (.thumbMP, .thumbIP), (.thumbIP, .thumbTip),
        (.wrist, .indexMCP), (.indexMCP, .indexPIP), (.indexPIP, .indexDIP), (.indexDIP, .indexTip),
        (.wrist, .middleMCP), (.middleMCP, .middlePIP), (.middlePIP, .middleDIP), (.middleDIP, .middleTip),
        (.wrist, .ringMCP), (.ringMCP, .ringPIP), (.ringPIP, .ringDIP), (.ringDIP, .ringTip),
        (.wrist, .littleMCP), (.littleMCP, .littlePIP), (.littlePIP, .littleDIP), (.littleDIP, .littleTip)
    ]

    var body: some View {
        GeometryReader { geo in
            ZStack {
                Path { path in
                    for (start, end) in connections {
                        guard let startPoint = points[start],
                              let endPoint = points[end] else { continue }

                        path.move(to: convert(startPoint, in: geo.size))
                        path.addLine(to: convert(endPoint, in: geo.size))
                    }
                }
                .stroke(.green, lineWidth: 3)

                ForEach(Array(points.keys), id: \.rawValue) { key in
                    if let point = points[key] {
                        Circle()
                            .fill(.red)
                            .frame(width: 9, height: 9)
                            .position(convert(point, in: geo.size))
                    }
                }
            }
        }
        .allowsHitTesting(false)
    }

    private func convert(_ point: CGPoint, in size: CGSize) -> CGPoint {
        CGPoint(
            x: point.x * size.width,
            y: (1 - point.y) * size.height
        )
    }
}

#Preview {
    HandPoseOverlayView(points: [:])
}
