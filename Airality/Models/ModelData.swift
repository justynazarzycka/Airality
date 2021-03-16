//
//  ModelData.swift
//  Airality
//
//  Created by Justyna Zarzycka on 15/03/2021.
//

import Foundation

final class NearestCityVM: ObservableObject {
//    @Published var nearestCity: NearestCity = apiCall().getUserComments { data in
//        nearestCity = data
//    }
    
    
}


class apiCall {
    func getUserComments(completion:@escaping (NearestCity) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            let data = try! JSONDecoder().decode(NearestCity.self, from: data!)
            print(data)
            
            DispatchQueue.main.async {
                completion(data)
            }
        }
        .resume()
    }
}
