//
//  GaugeProgressStyle.swift
//  GaugeProgressStyle
//
//  Created by Russell Gordon on 2021-08-02.
//

import Foundation
import SwiftUI

struct GaugeProgressStyle: ProgressViewStyle {
    var strokeWidth = 5.0

    func makeBody(configuration: Configuration) -> some View {
        let fractionCompleted = configuration.fractionCompleted ?? 0
        let percentCompleted = String(format: "%.0f", fractionCompleted * 100)

        return ZStack {
            Circle()
                .trim(from: 0, to: CGFloat(fractionCompleted))
                .stroke(Color(hue: fractionCompleted * 0.33, saturation: 0.8, brightness: 0.9), style: StrokeStyle(lineWidth: CGFloat(strokeWidth), lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("\(percentCompleted) %")
                .bold()
        }
    }
}
