//
//  NetworkingManager.swift
//  ExampleSOLID
//
//  Created by  vkrotin on 28.01.2021.
//
// -------------------------- Single responcibility --------------------------
//
// A class should have one and only one reason to change OR A class should have only one responsibility
//

import Foundation

// This is in Dependency inversion needed

protocol APIRequest {
    associatedtype RequestDataType
    associatedtype ResponceDataType
    func makeRequest(from data: RequestDataType) -> ModelUrlRequest
    func parseResponce(_ data: Data) throws -> ResponceDataType
}
//


class NetworkingManager<T: APIRequest> {
    
    private let apiRequest: T
    private let session: URLSession
    
    init(apiRequest: T, session: URLSession = URLSession.shared) {
        self.apiRequest = apiRequest
        self.session = session
    }
    
    
    func request(typeRequest: T.RequestDataType , completion: @escaping ((Result<T.ResponceDataType, ServerError>) -> Void) ) {
        guard let request = apiRequest.makeRequest(from: typeRequest).urlRequest else {
            completion(.failure(.requestCreation))
            return
        }
        
        session.dataTask(with: request) { data, responce, error in
            let result: Result<T.ResponceDataType, ServerError>
            
            if let error = error {
                result = .failure(ServerError(error))
            }
            else if let data = data {
                do {
                    let parseResponce = try self.apiRequest.parseResponce(data)
                    result = .success(parseResponce)
                }catch {
                    result = .failure(.parseError)
                }
            }
            else {
                result = .failure(.unknownError)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }.resume()
    }
    
    func request(modelRequest: ModelUrlRequest, completion: @escaping ((Result<Data, ServerError>) -> Void) ) {
        
        guard let request = modelRequest.urlRequest else {
            completion(.failure(.requestCreation))
            return
        }
        
        session.dataTask(with: request) { data, responce, error in
            let result: Result<Data, ServerError>
            
            if let error = error {
                result = .failure(ServerError(error))
            }
            else if let data = data {
                result = .success(data)
            }
            else {
                result = .failure(.unknownError)
            }
            
            DispatchQueue.main.async {
                completion(result)
            }
            
        }.resume()
    }
    
}
