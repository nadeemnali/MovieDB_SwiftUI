//
//  AppSettings.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

import Foundation

//Appsetting to retain values required throught the appliction
struct AppSettings {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhYmVkZDI2MTM4ODhjY2IxM2UwMjlmNjcwZDc4MmI0MiIsInN1YiI6IjY1MDQzM2Y3ZDdkY2QyMDBlMmZlZTJmNyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.zXTenrmioxqOebAb6yCQndwSR0g6iScMfarIlodA7EQ"
    static let sandbox = false
}

//Image configuration class to cache the response of images
class ImageConfiguration {
    static let sharedInstance = ImageConfiguration()
    var imageConfiguration: ConfigurationResponse?
    private init() {}
}
