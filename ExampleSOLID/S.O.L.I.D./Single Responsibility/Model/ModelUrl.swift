//
//  ModelUrl.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//

import Foundation

enum MethodType : String {
    case get = "GET",
    post = "POST",
    head = "HEAD",
    put = "PUT",
    delete = "DELETE"
}

struct ModelUrl {
    let path: String
    let urlType : UrlType
    let queryParams: [String: Any]?
    let isQueryItems : Bool
    
    init(path: String, urlType: UrlType, queryParams:  [String: Any]? = nil, isQueryItems: Bool = false) {
        self.path = path
        self.urlType = urlType
        self.queryParams = queryParams
        self.isQueryItems = isQueryItems
    }
}

extension ModelUrl {
    
    var url: URL? {
        let url = URL(string: urlType.urlString.url)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        components.scheme = urlType.urlString.scheme
        components.host = urlType.urlString.url
        components.path =  "/" + path
        
        if let port = urlType.urlString.port {
            components.port = port
        }
        if isQueryItems {
            components.queryItems = queryItems
        }
        
        return components.url
    }
    
    var query : String? {
        return url!.query
    }
    
    var queryData : Data? {
        return Data(query!.utf8)
    }
    
    private var queryItems: [URLQueryItem]? {
        guard let queryParams = queryParams else {
            return nil
        }
        
        let items = queryParams.map({ (k, v)  -> URLQueryItem in
            return URLQueryItem(name: k, value: String(describing: v))
        })
        return items
    }
}
