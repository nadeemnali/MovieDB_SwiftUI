//
//  MovieListView.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: MovieListViewModel
    @State var detailView: Bool = false
    
    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                if viewModel.movieList?.isEmpty ?? true {
                    ProgressView(label: {
                        Text("loading")
                    })
                    .onAppear() {
                        viewModel.getMoviesData()
                    }
                }
                LazyVStack {
                    ForEach(viewModel.movieList ?? []) { model in
                        NavigationLink(destination: getMovieDetailDestination(movieID: model.id)) {
                            MovieListCell(movieItem: model)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .navigationTitle(Text(CommonHelper.itemListTitle))
            .navigationBarTitleDisplayMode(.inline)
                      
        }
        .errorAlert(error: viewModel.showError ?? "")
    }
    
    private func getMovieDetailDestination(movieID: Int) -> MovieDetailView {
        MovieDetailView(viewModel: viewModel.getMovieDetailViewModel(movieID: movieID))
    }
}
