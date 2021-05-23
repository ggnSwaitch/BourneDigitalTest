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
    
    private var dataSourceAndDelegate : MoviesTableViewDataSource<MoviesTableViewCell, MoviesData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UpdateUI() 
        
    }
    
    
    func UpdateUI(){
        self.moviesViewModel = MoviesViewModel()
        self.updateDataSource()
    }
    
    
    func updateDataSource(){
        self.dataSourceAndDelegate = MoviesTableViewDataSource(cellIdentifier: "MoviesTableViewCell", items: self.moviesViewModel.moviesData.movies, moviesViewModel: self.moviesViewModel, configureCell: { (cell, evm) in
            cell.movie = evm
            
        })
        
        self.moviesTableView.dataSource = self.dataSourceAndDelegate
        self.moviesTableView.delegate = self
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


// TableView Delegates
extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 // height of tableview cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

       tableView.deselectRow(at: indexPath as IndexPath, animated: true)
        let selectedMoviesData: MoviesData = self.moviesViewModel.moviesData.movies[indexPath.row]

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let detailsViewController = storyBoard.instantiateViewController(withIdentifier: "detailsViewController") as! DetailsViewController
        detailsViewController.movieDetails = selectedMoviesData
        self.navigationController?.pushViewController(detailsViewController, animated: true)
        
   }

}


