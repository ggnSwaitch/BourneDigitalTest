//
//  MoviesViewModel.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import Foundation

class MoviesViewModel : NSObject{
    
    private var apiServie : APIService!
    
    private(set) var moviesData : Movies! {
        didSet{
            self.bindMoviesViewModelToController()
        }
    }
    
    var bindMoviesViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiServie = APIService()
        getMoviesData()
    }
    
    
    func getMoviesData() {
        self.apiServie.getMoviesData { (moviesData) in
            self.moviesData = moviesData
            
            print (moviesData)
        }
    }
    
}
