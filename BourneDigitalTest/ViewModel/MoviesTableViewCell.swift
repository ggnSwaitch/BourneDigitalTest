//
//  MoviewTableViewCell.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//


import UIKit

class MoviesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieNameLabel: UILabel!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    var movie : MoviesData? {
        didSet {
            movieNameLabel.text = movie?.title
            if(movie?.imageHref != nil)
            {
                movieImageView!.downloaded(from: movie?.imageHref ?? "") // assiging default value as empty string if JSON contains nil for image URL
            }
            else{
                movieImageView!.image = UIImage(named: "placeholderImage") ?? nil
            }
           
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
   
}

