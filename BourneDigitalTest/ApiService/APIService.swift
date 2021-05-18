//
//  APIService.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import Foundation

class APIService: NSObject {
    
    func getMoviesData(completion : @escaping (Movies) -> ()){
        if let url = Bundle.main.url(forResource: "movies", withExtension: "json") {
                do {
                    let data = try Data(contentsOf: url)
                    let decoder = JSONDecoder()
                    let jsonData = try decoder.decode(Movies.self, from: data)
                    completion(jsonData)
                } catch {
                    print("error:\(error)")
                }
            }

    }
    
}
