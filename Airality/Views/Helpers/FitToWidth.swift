//
//  FitToWidth.swift
//  Airality
//
//  Created by Justyna Zarzycka on 20/03/2021.
//

import SwiftUI

// adjust text size to width od view
struct FitToWidth: ViewModifier {
    let maximumFontSize: CGFloat
    let minimumFontSize: CGFloat = 0.1
    var lineLimit = 1
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: maximumFontSize))
            .minimumScaleFactor(minimumFontSize)
            .lineLimit(lineLimit)
    }
}

