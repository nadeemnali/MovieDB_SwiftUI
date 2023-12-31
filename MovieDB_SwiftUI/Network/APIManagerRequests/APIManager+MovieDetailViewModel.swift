//
//  APIManager+MovieDetailViewModel.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

extension MovieDetailViewModel {
    
    func getMovieDetail(movieID: Int, completionHandler: @escaping (NetworkResult<MovieDetailRequest.ResponseType>) -> Void) {
        if  AppSettings.sandbox {
            let jsonString = getMovieDetailOfflineJsonString()
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .useDefaultKeys
                let jsonData = jsonString.data(using: .utf8)!
                let response = try decoder.decode(MovieDetailRequest.ResponseType.self, from: jsonData)
                completionHandler(NetworkResult.success(response))
                return
            } catch _ {
                print("JSON Error")
                completionHandler(NetworkResult.failure(nil))
                return
            }
        }
        
        let req = MovieDetailRequest(movieID: movieID)
        apiManager.sendRequest(req: req, completionHandler: completionHandler)
    }
    
    func getMovieDetailOfflineJsonString () -> String {
        let jsonString = """
        {
          "adult": false,
          "backdrop_path": "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg",
          "belongs_to_collection": null,
          "budget": 145000000,
          "genres": [
            {
              "id": 35,
              "name": "Comedy"
            },
            {
              "id": 12,
              "name": "Adventure"
            },
            {
              "id": 14,
              "name": "Fantasy"
            }
          ],
          "homepage": "https://www.barbie-themovie.com",
          "id": 346698,
          "imdb_id": "tt1517268",
          "original_language": "en",
          "original_title": "Barbie",
          "overview": "Barbie and Ken are having the time of their lives in the colorful and seemingly perfect world of Barbie Land. However, when they get a chance to go to the real world, they soon discover the joys and perils of living among humans.",
          "popularity": 3173.706,
          "poster_path": "/iuFNMS8U5cb6xfzi51Dbkovj7vM.jpg",
          "production_companies": [
            {
              "id": 82968,
              "logo_path": "/gRROMOG5bpF6TIDMbfaa5gnFFzl.png",
              "name": "LuckyChap Entertainment",
              "origin_country": "US"
            },
            {
              "id": 437,
              "logo_path": "/nu20mtwbEIhUNnQ5NXVhHsNknZj.png",
              "name": "Heyday Films",
              "origin_country": "GB"
            },
            {
              "id": 181486,
              "logo_path": null,
              "name": "NB/GG Pictures",
              "origin_country": "US"
            },
            {
              "id": 6220,
              "logo_path": "/cAj69EL1zSXmZH6STbMGZrunyMD.png",
              "name": "Mattel",
              "origin_country": "US"
            }
          ],
          "production_countries": [
            {
              "iso_3166_1": "GB",
              "name": "United Kingdom"
            },
            {
              "iso_3166_1": "US",
              "name": "United States of America"
            }
          ],
          "release_date": "2023-07-19",
          "revenue": 1404802725,
          "runtime": 114,
          "spoken_languages": [
            {
              "english_name": "English",
              "iso_639_1": "en",
              "name": "English"
            }
          ],
          "status": "Released",
          "tagline": "She's everything. He's just Ken.",
          "title": "Barbie",
          "video": false,
          "vote_average": 7.331,
          "vote_count": 4369
        }
        """
        return jsonString
    }
}
