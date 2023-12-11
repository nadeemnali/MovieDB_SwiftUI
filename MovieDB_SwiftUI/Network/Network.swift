//
//  Network.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

// Created prepare request to create network request with parameters of json or path type
class Network {
    static func prepareRequest<T: Requestable>(for url: URL, req: T) -> URLRequest {
        var request: URLRequest? = nil
        
        switch req.query {
        case .json:
            request = URLRequest(url: url)
            if let params = req.parameters {
                do {
                    let body = try JSONSerialization.data(withJSONObject: params, options: [])
                    request!.httpBody = body
                } catch {
                    assertionFailure("Error: while attempting to serialize the data for preparing httpbody \(error)")
                }
            }
        case .path:
            var query = ""
            req.parameters?.forEach { key, value in
                query = query + "\(key)=\(value)&"
            }
            if query.hasPrefix("&") {
                query = String(query.dropLast())
            }
            
            var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
            if !query.isEmpty {
                components?.query = query
            }
            request = URLRequest(url: url)
        }
        
        request!.allHTTPHeaderFields = req.headers
        request!.httpMethod = req.method.rawValue
        return request!
    }

}
