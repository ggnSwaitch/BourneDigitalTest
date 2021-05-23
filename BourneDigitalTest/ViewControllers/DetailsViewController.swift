//
//  DetailsViewController.swift
//  BourneDigitalTest
//
//  Created by GaGan on 20/5/21.
//

import UIKit
import Cosmos
// Ref:https://cocoapods.org/pods/Cosmos

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieRating: CosmosView!
    
     var movieDetails : MoviesData! = nil


    init(viewModel : MoviesData) {
        super.init(nibName: nil, bundle: nil)
        self.movieDetails = viewModel
       
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self.movieDetails as Any)
        self.movieTitle?.text = self.movieDetails.title
        self.movieReleaseDate?.text = movieDetails.releaseDate
        self.movieRating?.rating = movieDetails.rating ?? 0
        // Change the text
        self.movieRating?.text = String(movieDetails.rating ?? 0)
        self.imageView.downloaded(from: (movieDetails.imageHref ?? ""))
        // Do any additional setup after loading the view.
    }

}
