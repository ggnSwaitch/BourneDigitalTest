//
//  APIService.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import Foundation

class APIService: NSObject {
    
    func getMoviesData(completion : @escaping (Movies) -> ()){
        if let url = URL(string: "https://www.dropbox.com/s/q1ins5dsldsojzt/movies.json?dl=1") {
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
