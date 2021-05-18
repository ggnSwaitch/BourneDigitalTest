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
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

        
   
}

