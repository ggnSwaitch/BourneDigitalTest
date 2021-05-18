//
//  ViewController.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import UIKit

class ViewController: UIViewController {
    private var moviesViewModel : MoviesViewModel!
    
    @IBOutlet weak var moviesTableView: UITableView! //Movies table view
    
    private var dataSource : MoviesTableViewDataSource<MoviesTableViewCell, MoviesData>!
    
    private var delegate: MoviesTableViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI() 
        
    }
    
    
    func UpdateUI(){
        self.moviesViewModel = MoviesViewModel()
        self.updateDataSource()
        self.updateDelegates()
    }
    
    
    func updateDelegates(){
        self.delegate = MoviesTableViewDelegate()
        self.moviesTableView.delegate = self.delegate
        
    }
    
    
    func updateDataSource(){
        
        self.dataSource = MoviesTableViewDataSource(cellIdentifier: "MoviesTableViewCell", items: self.moviesViewModel.moviesData.movies, configureCell: { (cell, evm) in
            
            cell.movieNameLabel.text = evm.title
            guard (evm.imageHref != nil) else { return }
            cell.movieImageView!.downloaded(from: evm.imageHref!)
             // assiging default value as empty string if JSON contains nil for image URL
        })
        
        self.moviesTableView.dataSource = self.dataSource
        self.moviesTableView.delegate = self.delegate
        self.moviesTableView.reloadData()   // reload table
    }
    
}


// Extension to async downlaod the image from the URL that we get form the JSON file
// Refered from Stackoverflow

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
