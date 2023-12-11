//
//  MovieDetailViewModel.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

class MovieDetailViewModel: ObservableObject {
    @Published var movieDetail: MovieItemConfigurable?
    @Published var showError : String?
    private var movieID: Int
    
    var apiManager: APIManagerProtocol
    
    init(movieID: Int, apiManager: APIManagerProtocol = APIManager.sharedInstance) {
        self.movieID = movieID
        self.apiManager = apiManager
    }
    
    //This method will get all the movie details from API
    func getMovieDetail() {
        getMovieDetail(movieID: movieID, completionHandler: { [weak self] result in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self?.movieDetail = response
                        if self?.movieDetail == nil {
                            self?.showError = CommonHelper.noResultsFound
                        }
                    }
                case .failure(_):
                    print("failed")
                    DispatchQueue.main.async {
                        self?.showError = CommonHelper.errorMessage
                    }
            }
        })
    }
}
