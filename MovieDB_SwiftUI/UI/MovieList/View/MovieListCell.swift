//
//  MovieListCell.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

public protocol MovieItemConfigurable {
    var itemTitle: String { get }
    var itemDescription: String { get }
    var itemPhotoURL: URL? { get }
    var itemDate: String { get }
    var itemVoteAverage: String { get }
}

struct MovieListCell: View {
    
    var movieItem: MovieItemConfigurable
    
    var body: some View {
        Divider()
        VStack(alignment: .leading)
        {
            HStack{
                HStack(alignment: .top) {
                    ImageView(urlString: movieItem.itemPhotoURL?.absoluteString ?? "", image: UIImage(named: "placeholderImage"))
                        .aspectRatio(.none, contentMode: .fit)
                        .frame(width: 120, height: 120)
                }
                VStack(alignment: .leading) {
                    Text(movieItem.itemTitle)
                        .bold()
                    Text(movieItem.itemVoteAverage)
                        .fontWeight(.medium)
                    Text(movieItem.itemDate)
                    Text(movieItem.itemDescription)
                        .fontWeight(.light)
                        .multilineTextAlignment(.leading)
                        .lineLimit(3)
                }
            }
        }
    }
    
}

#Preview {
    MovieListCell(movieItem: MovieModel(adult: true, genreIds: [0], id: 0, originalLanguage: "test", originalTitle: "test", overview: "test", popularity: 1, releaseDate: "", title: "", video: false, voteAverage: 3, voteCount: 2))
}
