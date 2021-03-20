//
//  AriVisualAPI.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation
import Combine

struct AirVisualApi {
    
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "http://api.airvisual.com/v2")
    
}

enum EndPoint: String {
    // uses IP geolocation
    case nearestCityToIP = "/nearest_city"
}

extension AirVisualApi {
    static func request(_ endPoint: EndPoint) -> AnyPublisher<City, Error> {
        
        // add end point to URL
        guard var components = URLComponents(url: baseUrl!.appendingPathComponent(endPoint.rawValue), resolvingAgainstBaseURL: true)
        else {
            fatalError("Couldn't create URLComponents")
        }
        
        // add API key to URL
        components.queryItems = [URLQueryItem(name: "key", value: "b15370b5-869e-43c4-861b-998a1ba23ae6")]
        let request = URLRequest(url: components.url!)
        
        // run request through ApiClient
        return apiClient.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
