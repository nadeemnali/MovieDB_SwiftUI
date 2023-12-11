//
//  MovieListViewModel.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movieList: [MovieModel]?
    @Published var showError: String?
    var apiManager: APIManagerProtocol

    init(apiManager: APIManagerProtocol) {
        self.apiManager = apiManager
    }

    func getMoviesData() {
        getImageConfiguration { [weak self] in
            self?.getMovieList()
        }
        
    }

    //This method will get all the movie list from API
    private func getMovieList() {
        getMovieListData { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self?.movieList = response.results
                        if self?.movieList?.isEmpty ?? true {
                            self?.showError = CommonHelper.noResultsFound
                        }
                    }
                case .failure(_):
                    DispatchQueue.main.async {
                        self?.showError = CommonHelper.errorMessage
                    }
            }
        }
    }
    
    //This method will get all the image configurations from API
   private func getImageConfiguration(completionHandler: @escaping () -> Void) {
        getImageConfiguration { [weak self] result in
            completionHandler()
            switch result {
                case .success(let response):
                    ImageConfiguration.sharedInstance.imageConfiguration = response
                case .failure(_):
                    DispatchQueue.main.async {
                        self?.showError = CommonHelper.errorMessage
                    }
            }
        }
    }
    
    func getMovieDetailViewModel(movieID: Int) -> MovieDetailViewModel {
        MovieDetailViewModel(movieID: movieID)
    }
}
