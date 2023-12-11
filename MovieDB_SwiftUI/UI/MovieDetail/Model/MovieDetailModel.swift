//
//  MovieDetailModel.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

struct MovieDetailModel: Codable {
    var adult: Bool
    var backdropPath: String?
    var belongs_to_collection: String?
    var budget: Double?
    var genres: [Genre]
    var homepage: String?
    var id: Int
    var imdbID: String?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var popularity: Double?
    var posterPath: String?
    var productionCompanies: [ProductionCompanies]?
    var productionCountries: [ProductionCountries]?
    var releaseDate: String?
    var revenue: Double?
    var runtime: Int?
    var spokenLanguages: [SpokenLanguages]
    var status: String?
    var tagline: String?
    var title: String?
    var video : Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genres = "genres"
        case homepage = "homepage"
        case id = "id"
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue = "revenue"
        case runtime = "runtime"
        case spokenLanguages = "spoken_languages"
        case status = "status"
        case tagline = "tagline"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct Genre: Codable {
    let id: Int?
    let name: String?
}

struct ProductionCompanies: Codable {
    let id: Int?
    let logoPath: String?
    let name: String?
    let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case logoPath = "logo_path"
        case name = "name"
        case originCountry = "origin_country"
    }
}

struct ProductionCountries: Codable {
    let iso31661: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso31661 = "iso_3166_1"
        case name = "name"
    }
}

struct SpokenLanguages: Codable {
    let englishName: String?
    let iso6391: String?
    let name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso6391 = "iso_639_1"
        case name = "name"
    }
}
