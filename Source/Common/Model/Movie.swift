//
//  Movie.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation

struct MovieResponse: Codable{
    let lastBuildDate: String
    let total: Int
    let start: Int
    let display: Int
    let items: [Movie]
}

struct Movie: Codable{
    let title: String
    let image: String
    let link: String
    let subtitle: String
    let pubDate: String
    let director: String
    let actor: String
    let userRating: String
}
