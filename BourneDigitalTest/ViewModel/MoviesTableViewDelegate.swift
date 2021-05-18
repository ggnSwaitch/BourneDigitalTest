//
//  MoviesTableViewDelegate.swift
//  BourneDigitalTest
//
//  Created by Gagandeep Kaur Swaitch on 18/5/21.
//

import UIKit

class MoviesTableViewDelegate : NSObject, UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70 // height of tableview cell
    }
}
