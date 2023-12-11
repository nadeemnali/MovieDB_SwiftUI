//
//  MovieListTests.swift
//  MovieDB_SwiftUITests
//
//  Created by Nadeem Ali on 10/12/2023.
//

import XCTest
@testable import MovieDB_SwiftUI


final class MovieListViewModelTests: XCTestCase {
    
    // To create a unit test for the `getMovieList` method, you can use XCTest, which is the testing framework provided by Apple. Below is an example of how you might structure a test case for this function. The key is to use XCTest assertions to check if the expected behavior is happening.
    
    var movieListViewModel: MovieListViewModel!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let mockManager = MockAPIManager()
        movieListViewModel = MovieListViewModel(apiManager: mockManager)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieListViewModel = nil
    }
    
    func testGetMovieListSuccess() throws {
        // Given

        let expectation = XCTestExpectation(description: "Fetching movie list successfully")
        
        // When
        let mockManager = MockAPIManager()
        mockManager.mockData = getMockData()
        movieListViewModel.apiManager = mockManager
        movieListViewModel.getMoviesData()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is not nil
            XCTAssertNotNil(self.movieListViewModel.movieList, "Movie list should not be nil")
            
            // Check if the showError is nil, indicating no error occurred
            XCTAssertNil(self.movieListViewModel.showError, "No error should be present")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
    
    func testGetMovieListFailure() throws {
        // Given
        let expectation = XCTestExpectation(description: "Fetching movie list with failure")
        
        // When
        // Simulate a failure scenario, using mock APIManager for this.
        // Mock APIManager is injected to mock for testing.
        let mockManager = MockAPIManager()
        mockManager.shouldSucceed = false
        movieListViewModel.apiManager = mockManager
        movieListViewModel.getMoviesData()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is nil
            XCTAssertNil(self.movieListViewModel.movieList, "Movie list should be nil in case of failure")
            
            // Check if an error message is set
            XCTAssertNotNil(self.movieListViewModel.showError, "Error message should be present in case of failure")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
    
    func testGetMovieList_InvalideData_Failure() throws {
        // Given
        let expectation = XCTestExpectation(description: "Fetching movie list with invalid data failure")
        
        // When
        // Simulate a failure scenario, using mock APIManager for this.
        // Mock APIManager is injected to mock for testing.
        let mockManager = MockAPIManager()
        mockManager.shouldSucceed = false
        mockManager.mockData = getInvalidMockData()
        movieListViewModel.apiManager = mockManager
        movieListViewModel.getMoviesData()
        
        // Then
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            // Assuming API call takes less than 5 seconds to complete.
            
            // Check if movieList is nil
            XCTAssertNil(self.movieListViewModel.movieList, "Movie list should be nil in case of failure")
            
            // Check if an error message is set
            XCTAssertNotNil(self.movieListViewModel.showError, "Error message should be present in case of failure")
            
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 10.0) // Adjust the timeout value based on API response time
    }
}
extension MovieListViewModelTests {
    func getMockData() -> Data {
        // Mock data for a successful response
        let mockMovieData: Data = """
            {
              "page": 1,
              "results": [
                {
                  "adult": false,
                  "backdrop_path": "/8YFL5QQVPy3AgrEQxNYVSgiPEbe.jpg",
                  "genre_ids": [
                    28,
                    12,
                    878
                  ],
                  "id": 640146,
                  "original_language": "en",
                  "original_title": "Ant-Man and the Wasp: Quantumania",
                  "overview": "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
                  "popularity": 9272.643,
                  "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
                  "release_date": "2023-02-15",
                  "title": "Ant-Man and the Wasp: Quantumania",
                  "video": false,
                  "vote_average": 6.5,
                  "vote_count": 1856
                },
              ],
              "total_pages": 38020,
              "total_results": 760385
            }
    """.data(using: .utf8)!
        return mockMovieData
    }
    
    func getInvalidMockData() -> Data {
        // Mock data for a invalid response
        let mockMovieData: Data = """
            {
              "page": 1,
              "results": [
                {
                  "id": 640146,
                  "original_title": "Ant-Man and the Wasp: Quantumania",
                  "overview": "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
                  "vote_count": 1856
                },
              ],
              "total_pages": 38020,
              "total_results": 760385
            }
    """.data(using: .utf8)!
        return mockMovieData
    }
    
}
