//
//  MovieListRequest.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

//Request for movie list with response type
struct MovieListRequest: Requestable {
    typealias ResponseType = MoviesResponse
    
    var baseURL: URL {
        return URL(string: AppSettings.baseURL)!
    }
    
    var endpoint: String {
        return String(format: EndPoint.movieList)
    }
    
    var method: NetworkMethod {
        return .get
    }
    
    var query: NetworkQueryType {
        return .json
    }
    
    var parameters: [String : Any]? {
        return nil
    }
}

struct MoviesResponse: Codable {
    let page: Int?
    var results: [MovieModel]?
    let total_pages: Double?
    let total_results: Double?
}
