//
//  MyLines.swift
//  Airality
//
//  Created by Justyna Zarzycka on 18/03/2021.
//

import SwiftUI

struct MyLines: View {
    var height: CGFloat
    var width: CGFloat

    @State private var percentage: CGFloat = .zero
    var body: some View {

        // ZStack {         // as for me, looks better w/o stack which tighten path
            Path { path in
                path.move(to: CGPoint(x: 0, y: height/2))
                path.addLine(to: CGPoint(x: width/2, y: height))
                path.addLine(to: CGPoint(x: width, y: 0))
            }
            .trim(from: 0, to: percentage) // << breaks path by parts, animatable
            .stroke(Color.black, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
            .animation(.easeOut(duration: 2.0)) // << animate
            .onAppear {
                self.percentage = 1.0 // << activates animation for 0 to the end
            }

        //}
    }
}

struct MyLines_Previews: PreviewProvider {
    static var previews: some View {
        MyLines(height: 100, width: 100)
    }
}
