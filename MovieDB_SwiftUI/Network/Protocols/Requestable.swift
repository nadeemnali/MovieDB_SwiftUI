//
//  Requestable.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

// Base Protocol to create network request
public protocol Requestable {
    associatedtype ResponseType: Decodable

    var endpoint: String { get }
    var method: NetworkMethod { get }
    var query: NetworkQueryType { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var baseURL: URL { get }
}
