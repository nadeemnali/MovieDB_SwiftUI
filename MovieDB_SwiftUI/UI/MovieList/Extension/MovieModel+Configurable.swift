//
//  MovieModel+Configurable.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

protocol ImageConfigurationable {
    var basePhotoURL: String { get }
    var imageSize: String { get }
    var imageURL: URL? { get }
}
extension ImageConfigurationable {
    var basePhotoURL: String {
        ImageConfiguration.sharedInstance.imageConfiguration?.images?.baseURL ?? ""
    }
}

//Configuration for item to be displayed in the cell
extension MovieModel: MovieItemConfigurable, ImageConfigurationable {
    var itemPhotoURL: URL? {
        imageURL
    }
    
    var imageSize: String {
        ImageConfiguration.sharedInstance.imageConfiguration?.images?.posterSizes?.first(where: { $0 == CommonHelper.defaultPosterSize }) ?? CommonHelper.defaultPosterSize
    }
    
    var itemTitle: String {
        originalTitle
    }

    var itemDescription: String {
        overview
    }

    var imageURL: URL? {
        guard let urlString = posterPath, let itemURL = URL(string: basePhotoURL + imageSize + "/" + urlString) else { return nil }

        return itemURL
    }
    
    var itemDate: String {
        "Released On: " + releaseDate
    }
    
    var itemVoteAverage: String {
        "Vote Average: " + String(voteAverage)
    }
}
