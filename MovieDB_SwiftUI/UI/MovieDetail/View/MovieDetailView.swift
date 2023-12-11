//
//  MovieDetailView.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.movieDetail == nil {
                    ProgressView()
                        .onAppear(){
                            viewModel.getMovieDetail()
                        }
                }
                
                if let imageURL = viewModel.movieDetail?.itemPhotoURL?.absoluteString {
                    ImageView(urlString: imageURL)
                        .frame(maxHeight: 300)
                        .aspectRatio(.none, contentMode: .fit)
                        .border(.black)
                }
                Divider()
                VStack(alignment: .leading)
                {
                    Text(viewModel.movieDetail?.itemTitle ?? "")
                        .fontWeight(.heavy)      
                        .accessibility(identifier: "itemDetailTitle")
                        .accessibility(label: Text(viewModel.movieDetail?.itemTitle ?? "detailTitle"))
                    
                    Text(viewModel.movieDetail?.itemDate ?? "")
                        .accessibility(identifier: "itemDetailDate")
                        .accessibility(label: Text(viewModel.movieDetail?.itemDate ?? "itemDetailDate"))
                    
                    Text(viewModel.movieDetail?.itemVoteAverage ?? "")
                        .accessibility(identifier: "itemDetailVoteAverage")
                        .accessibility(label: Text(viewModel.movieDetail?.itemVoteAverage ?? "itemDetailVoteAverage"))
                    
                    Spacer()
                    Text(viewModel.movieDetail?.itemDescription ?? "")
                        .accessibility(identifier: "itemDetailDescription")
                        .accessibility(label: Text(viewModel.movieDetail?.itemDescription ?? "itemDetailDescription"))
                    
                }.padding()
            }
        }
        .navigationTitle(Text(CommonHelper.itemDetailTitle))
        .navigationBarTitleDisplayMode(.inline)
        .errorAlert(error: viewModel.showError ?? "")
    }
    
    
}

#Preview {
    MovieDetailView(viewModel: MovieDetailViewModel(movieID: 1))
}
