//
//  GitHubModel.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 29.01.2021.
//

import Foundation

struct GitHubModel : Codable {
    let name: String?
    let location: String?
    let followers: Int?
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case name, location, followers, avatarUrl = "avatar_url"
    }
}
