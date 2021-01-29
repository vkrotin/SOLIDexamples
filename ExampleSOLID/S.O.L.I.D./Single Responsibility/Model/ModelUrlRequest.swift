//
//  ModelUrlRequest.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//

import Foundation

extension URLRequest {
    init(url: URL, type: MethodType, data : Data? = nil, cachePolicy: URLRequest.CachePolicy) {
        self.init(url: url)
        
        self.cachePolicy = cachePolicy
        self.httpMethod = type.rawValue
        self.httpBody = data
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
    }
}

struct ModelUrlRequest {
    
    private let cachePolicy: URLRequest.CachePolicy = .reloadRevalidatingCacheData
    let urlRequest: URLRequest?
    
    init(type: MethodType = .get, path: String, urlType: UrlType, parameters:[String: Any]? = nil, isQueryItems: Bool = false) {
        
        guard let url = ModelUrl(path: path, urlType: urlType, queryParams: parameters, isQueryItems: isQueryItems).url  else {
            urlRequest = nil
            return
        }
        
        var data: Data?
        if let params = parameters, let _data = try? JSONSerialization.data(withJSONObject: params), isQueryItems == false {
            data = _data
        }
    
        self.urlRequest = URLRequest(url: url, type: type, data: data, cachePolicy: cachePolicy)
    }
    
    
}
