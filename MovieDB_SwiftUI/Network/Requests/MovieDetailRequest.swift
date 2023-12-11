//
//  MovieDetailRequest.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

//Request for fetching movie details by ID

struct MovieDetailRequest: Requestable {
    typealias ResponseType = MovieDetailModel
    
    private let movieID: Int

    
    init(movieID: Int) {
        self.movieID = movieID
    }
    
    var baseURL: URL {
        return URL(string: AppSettings.baseURL)!
    }
    
    var endpoint: String {
        return String(format: EndPoint.movieDetail, movieID)
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
