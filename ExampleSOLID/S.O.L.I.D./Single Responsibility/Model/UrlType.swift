//
//  UrlType.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 29.01.2021.
//

import Foundation

enum UrlType {
    case mapForDay,
    mapForNight,
    service,
    guthub
    
    var urlString : UrlString {
        switch self {
        case .mapForDay:
            return UrlString("http", "some_day_url_address", 8081)
        case .mapForNight:
            return UrlString("http", "some_night_url_address", 8082)
        case .service:
            return UrlString("http", "some_service_url_address", 8881)
        case .guthub:
            return UrlString("https", "api.github.com", nil)
        }
    }
}


struct UrlString {
    let scheme : String
    let url : String
    let port : Int?
    
    init(_ scheme: String = "http", _ url: String, _ port: Int?) {
        self.scheme = scheme
        self.url = url
        self.port = port
    }
    
    var fullPath : String {
        guard let port = port else {
            return "\(scheme)://\(url)"
        }
        
        return "\(scheme)://\(url):\(port)"
    }
}
