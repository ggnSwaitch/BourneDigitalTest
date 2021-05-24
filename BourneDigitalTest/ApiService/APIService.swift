//
//  APIService.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import Foundation
import Alamofire

class APIService: NSObject {
    
    func getMoviesData(completion : @escaping (Movies) -> ()){
        
        AF.request("https://www.dropbox.com/s/q1ins5dsldsojzt/movies.json?dl=1").responseData { response in
            switch response.result {
            case .failure(let error):
                print(error)
            case .success(let data):
                do {
                    let pageData = try JSONDecoder().decode(Movies.self, from: data)
                    completion(pageData)
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
}


//REf:https://www.raywenderlich.com/6587213-alamofire-5-tutorial-for-ios-getting-started
