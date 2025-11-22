//
//  Model.swift
//  HackerNews
//
//  Created by @ivansaul on 7/28/25.
//
//  https://github.com/ivansaul
//

import Foundation

struct Item: Identifiable {
    let id: Int
    let commentCount: Int
    let score: Int
    let author: String
    let title: String
    let date: Date
    let url: URL
}

extension Item: Decodable {
    enum CodingKeys: String, CodingKey {
        case author = "by"
        case commentCount = "descendants"
        case id
        case score
        case date = "time"
        case title
        case url
    }
}
