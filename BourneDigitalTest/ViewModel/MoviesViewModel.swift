//
//  MoviesViewModel.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import Foundation

protocol ViewModelPressible {
    var cellPressed: (()->Void)? { get set }
}

class MoviesViewModel : NSObject, ViewModelPressible{
    var cellPressed: (() -> Void)?
    
    
    private var apiServie : APIService!
    
    private(set) var moviesData : Movies! {
        didSet{
            self.bindMoviesViewModelToController()  // biinding the viewmodel to the View controller
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
            
        }
    }
    
    
    
}
