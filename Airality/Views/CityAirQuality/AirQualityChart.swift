//
//  PieChart.swift
//  Airality
//
//  Created by Justyna Zarzycka on 18/03/2021.
//

import SwiftUI

struct AirQualityChart: View {
    var aqi: Int
    var color: Color

    var startAngle = -230.0
    var backgroundLineEndAngle = -310.0
    var chartLineEndAngle: Double {
        return -(-startAngle - (Double(aqi) / 500.0 * 280))
    }
    
    @State private var animatedPercantage: CGFloat = .zero
    
    var body: some View {
        ZStack {
            Arc(startAngle: .degrees(startAngle), endAngle: .degrees(backgroundLineEndAngle), clockwise: false)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundColor(.gray)
            
            Arc(startAngle: .degrees(startAngle), endAngle: .degrees(chartLineEndAngle), clockwise: false)
                .trim(from: 0, to: animatedPercantage) // divides the path into parts
                .stroke(color, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .animation(.easeOut(duration: 2.0))
                .onAppear {
                    self.animatedPercantage = 1.0 // activates animation from 0 to the end
                }
        }
    }
}

struct AirQualityChart_Previews: PreviewProvider {
    static var previews: some View {
        AirQualityChart(aqi: 55, color: .green)
    }
}
