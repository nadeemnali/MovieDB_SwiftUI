//
//  MovieDetailsTests.swift
//  MovieDB_SwiftUITests
//
//  Created by Nadeem Ali on 11/12/2023.
//

import XCTest
@testable import MovieDB_SwiftUI

final class MovieDetailViewModelTests: XCTestCase {
    
    // To create a unit test for the `getMovieList` method, you can use XCTest, which is the testing framework provided by Apple. Below is an example of how you might structure a test case for this function. The key is to use XCTest assertions to check if the expected behavior is happening.
    
    var movieDetailViewModel: MovieDetailViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockManager = MockAPIManager()
        movieDetailViewModel = MovieDetailViewModel(movieID: 346698, apiManager: mockManager)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieDetailViewModel = nil
    }
    
    func testGetMovieDetailSuccess() throws {
        // Given
        
        let expectation = XCTestExpectation(description: "Fetching movie list successfully")
        
        // When
        let mockManager = MockAPIManager()
        mockManager.mockData = getMockData()
        movieDetailViewModel.apiManager = mockManager
        movieDetailViewModel.getMovieDetail()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is not nil
            XCTAssertNotNil(self.movieDetailViewModel.movieDetail, "Movie list should not be nil")
            
            // Check if the showError is nil, indicating no error occurred
            XCTAssertNil(self.movieDetailViewModel.showError, "No error should be present")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
    
    func testGetMovieDetailFailure() throws {
        // Given
        let expectation = XCTestExpectation(description: "Fetching movie list with failure")
        
        // When
        // Simulate a failure scenario, using mock APIManager for this.
        // Mock APIManager is injected to mock for testing.
        let mockManager = MockAPIManager()
        mockManager.shouldSucceed = false
        movieDetailViewModel.apiManager = mockManager
        movieDetailViewModel.getMovieDetail()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is nil
            XCTAssertNil(self.movieDetailViewModel.movieDetail, "Movie list should be nil in case of failure")
            
            // Check if an error message is set
            XCTAssertNotNil(self.movieDetailViewModel.showError, "Error message should be present in case of failure")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
    
    func testGetMovieDetail_Invalid_Data_Failure() throws {
        // Given
        let expectation = XCTestExpectation(description: "Fetching movie list with failure")
        
        // When
        // Simulate a failure scenario, using mock APIManager for this.
        // Mock APIManager is injected to mock for testing.
        let mockManager = MockAPIManager()
        mockManager.shouldSucceed = false
        mockManager.mockData = getInvalidMockData()
        movieDetailViewModel.apiManager = mockManager
        movieDetailViewModel.getMovieDetail()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is nil
            XCTAssertNil(self.movieDetailViewModel.movieDetail, "Movie list should be nil in case of failure")
            
            // Check if an error message is set
            XCTAssertNotNil(self.movieDetailViewModel.showError, "Error message should be present in case of failure")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
}
extension MovieDetailViewModelTests {
    func getMockData() -> Data {
        // Mock data for a successful response
        let mockMovieData: Data = """
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
        """.data(using: .utf8)!
        return mockMovieData
    }
    
    func getInvalidMockData() -> Data {
        // Mock data for a invalid response
        let mockMovieData: Data = """
        {
          "adult": false
          "backdrop_path": "/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg",
          "belongs_to_collection": null
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
        """.data(using: .utf8)!
        return mockMovieData
    }
}
