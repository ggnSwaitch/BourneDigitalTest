//
//  MoviesModel.swift
//  Test
//
//  Created by Gagandeep Kaur Swaitch on 17/5/21.
//

import Foundation

struct Movies: Decodable {
    let title: String
    let movies: [MoviesData]
}

struct MoviesData: Decodable {
    let title: String
    let imageHref: String?
    let rating: Double?
    let releaseDate: String

}

