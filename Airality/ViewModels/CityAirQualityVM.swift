//
//  CityAirQualityVM.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation
import Combine

final class CityAirQualityVM: ObservableObject {
    
    //@Published var airQuality = CityAirQuality(status: "dupa")
    @Published var airQuality = CityAirQuality(status: "", data: CityAirQuality.CityData(city: "", state: "", country: ""))
    var cancellationToken: AnyCancellable?
    
    init() {
        // fetch data as soon as ViewModel is created
        getData()
    }
}

extension CityAirQualityVM {
    
    func getData() {
        cancellationToken = AirVisualApi.request(.nearestCityToIP)
            .mapError({ (error) -> Error in 
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in },
                  receiveValue: {
                    self.airQuality = $0
                  })
    }
}
