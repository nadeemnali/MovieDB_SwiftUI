//
//  NetworkHelper.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

public enum NetworkMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum NetworkQueryType {
    case json, path
}

public enum NetworkResult<T> {
    case success(T)
    case failure(Error?)
}
