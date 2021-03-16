//
//  ContentView.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = CityAirQualityVM()
    
    
    var body: some View {
        Text(viewModel.airQuality.data.city)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
