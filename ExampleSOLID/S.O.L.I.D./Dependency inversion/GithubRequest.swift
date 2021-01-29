//
//  GithubRequest.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 29.01.2021.
//

import Foundation

enum GithubPaths: String {
    case users = "users/vkrotin",
         all = "any"
}

struct GithubRequest: APIRequest {
    
    func makeRequest(from path: GithubPaths) -> ModelUrlRequest {
        return ModelUrlRequest(path: path.rawValue, urlType: .guthub)
    }
    
    func parseResponce(_ data: Data) throws -> GitHubModel {
        return try JSONDecoder().decode(GitHubModel.self, from: data)
    }
}
