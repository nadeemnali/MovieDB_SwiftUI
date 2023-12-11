//
//  MovieDetailModel+Configurable.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

//Configuration for item to be displayed in the cell
extension MovieDetailModel: MovieItemConfigurable {
    var itemPhotoURL: URL? {
        imageURL
    }
    
    var itemTitle: String {
        originalTitle ?? ""
    }

    var itemDescription: String {
        overview ?? ""
    }
    
    var itemDate: String {
        "Released On: " + (releaseDate ?? "")
    }
    
    var itemVoteAverage: String {
        "Vote Average: " + String(voteAverage ?? 0.0)
    }
}


extension MovieDetailModel: ImageConfigurationable {

    var imageSize: String {
        ImageConfiguration.sharedInstance.imageConfiguration?.images?.backdropSizes?.first(where: { $0 == CommonHelper.defaultBackdropSize }) ?? CommonHelper.defaultBackdropSize
    }
    
    var imageURL: URL? {
        guard let urlString = backdropPath, let itemURL = URL(string: basePhotoURL + imageSize + "/" + urlString) else { return nil }

        return itemURL
    }
}
