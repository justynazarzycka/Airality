//
//  RoundedRecatngle.swift
//  Airality
//
//  Created by Justyna Zarzycka on 19/03/2021.
//

import SwiftUI

struct RectangleBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25.0)
            .foregroundColor(.white)
            .shadow(radius: 7)
    }
}

struct RoundedRecatngle_Previews: PreviewProvider {
    static var previews: some View {
        RectangleBackground()
    }
}
