//
//  Requestable+Default.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

extension Requestable {
    var defaultJSONHeader: [String: String] {
        return ["Content-Type": "application/json"]
    }

    var defaultJSONHeaderWithAuthentication: [String: String] {
        var header = defaultJSONHeader
        header["Authorization"] = "Bearer \(AppSettings.apiKey)"
        return header
    }

    var baseURL: URL {
        return URL(string: AppSettings.baseURL)!
    }

    var query: NetworkQueryType { .json }
    var headers: [String: String]? { defaultJSONHeaderWithAuthentication }
}
