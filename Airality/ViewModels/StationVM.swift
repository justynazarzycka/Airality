//
//  CityAirQualityVM.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation
import Combine

final class StationVM: ObservableObject {
    
    @Published var stationData: Station?
    var cancellationToken: AnyCancellable?
    
    init() {
        // fetch data as soon as ViewModel is created
        getData()
    }
}

extension StationVM {
    
    func getData() {
        cancellationToken = AirVisualApi.request(.nearestCityToIP)
            .mapError({ (error) -> Error in 
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.stationData = $0
                  })
    }
}
