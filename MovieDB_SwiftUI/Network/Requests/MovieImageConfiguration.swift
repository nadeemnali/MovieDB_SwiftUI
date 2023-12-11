//
//  MovieImageConfiguration.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

//Request for image configuration  with response type
struct MovieImageConfigurationRequest: Requestable {
    typealias ResponseType = ConfigurationResponse
    
    var baseURL: URL {
        return URL(string: AppSettings.baseURL)!
    }
    
    var endpoint: String {
        return String(format: EndPoint.configuration)
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

struct ConfigurationResponse: Codable {
    let images: ConfigImages?
    let changeKeys: [String]?
    
    enum CodingKeys: String, CodingKey {
        case images
        case changeKeys = "change_keys"
    }
}

struct ConfigImages: Codable {
    let baseURL: String?
    let secureBaseURL: String?
    let backdropSizes: [String]?
    let logoSizes: [String]?
    let posterSizes: [String]?
    let profileSizes: [String]?
    let stillSizes: [String]?
    
    enum CodingKeys: String, CodingKey {
        case baseURL = "base_url"
        case secureBaseURL = "secure_base_url"
        case backdropSizes = "backdrop_sizes"
        case logoSizes = "logo_sizes"
        case posterSizes = "poster_sizes"
        case profileSizes = "profile_sizes"
        case stillSizes = "still_sizes"
    }
}
