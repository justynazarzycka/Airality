//
//  ApiClient.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation
import Combine

struct APIClient {

    struct Response<T> {
        let value: T
        let response: URLResponse
    }

    func run<T: Decodable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error> {
        return URLSession.shared
            // turn URLSession into Publisher
            .dataTaskPublisher(for: request)
            .tryMap { result -> Response<T> in
                // decode the result
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
            }
            // return the result on main thread
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
            
    }
}
