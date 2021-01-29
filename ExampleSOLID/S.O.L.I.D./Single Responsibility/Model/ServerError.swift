//
//  ServerError.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//

import Foundation

protocol ServerErrorProtocol: LocalizedError {
    var title: String? { get }
    var code: Int { get }
}

protocol LocalServerError {
    static var requestCreation: ServerError { get }
    static var unknownError: ServerError { get }
    static var parseError: ServerError { get }
}

extension LocalServerError {
    
    static var requestCreation: ServerError {
        return ServerError(dict: ["payload": "No valid URL Request"], code: -1)
    }
    
    static var unknownError: ServerError  {
        return ServerError(dict: ["payload": "Unknown error"], code: -100)
    }
    
    static var parseError: ServerError {
        return ServerError(dict: ["payload": "Parse data error"], code: -200)
    }
}

struct ServerError : ServerErrorProtocol, LocalServerError {
    
  
    
    var title: String?
    var code: Int
    var errorDescription: String? { return description }
    var failureReason: String? { return description }
    
    private var description: String
    
    init(dict: [String : Any], code: Int) {
        self.title = dict["title"] as? String ?? "Error"
        self.description = dict["payload"] as? String ?? ""
        self.code = code
    }
    
    init(_ swift:Error?) {
        self.title = "System error"
        self.description = swift?.localizedDescription ?? ""
        self.code = -1
    }
    

    
}


