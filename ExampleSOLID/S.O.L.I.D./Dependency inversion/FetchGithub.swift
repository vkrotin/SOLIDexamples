//
//  FetchGithub.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 29.01.2021.
//
//---------------------------- Dependency inversion ---------------------------
//
// One should “depend upon abstractions, [not] concretions.
// OR (Program to an interface )
// OR (Abstractions should never depend upon details. Details should depend upon abstractions.)
//


import Foundation


class FetchGithub {
    
    func fetchUser() {
        let loader = NetworkingManager(apiRequest: GithubRequest())
        loader.request(typeRequest: .users) { result in
            switch result {
            case .success(let user):
                print(user)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
}
