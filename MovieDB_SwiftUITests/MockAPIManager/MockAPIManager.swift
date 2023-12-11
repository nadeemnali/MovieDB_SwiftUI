//
//  MockAPIManager.swift
//  MovieDB_SwiftUITests
//
//  Created by Nadeem Ali on 10/12/2023.
//
import Foundation
@testable import MovieDB_SwiftUI

//Mock Error cases for API response
enum MockError: Error {
    case networkError
    case serverError
    case parsingError
}

final class MockAPIManager: APIManagerProtocol {
    
    var shouldSucceed: Bool = true // You can set this flag to control whether the mock should succeed or fail
    var mockData: Data?
    
    
    func request<T>(req: T, completionHandler: @escaping (URLResponse?, Data?, Error?) -> Void) where T : MovieDB_SwiftUI.Requestable {
        // Implement mocking logic for request method if needed
        completionHandler(URLResponse(), Data(), nil)
    }
    
    func getAPIData<T>(req: T, completionHandler: @escaping (MovieDB_SwiftUI.NetworkResult<T.ResponseType>) -> Void) where T : MovieDB_SwiftUI.Requestable {
        if shouldSucceed {
            // Mock a successful response
            let mockData: Data = mockData ?? Data()
            completionHandler(MovieDB_SwiftUI.NetworkResult.success(mockData as! T.ResponseType))
        } else {
            // Mock a failure response with a specific error
            let mockError: Error
            switch req.endpoint {
                case "networkErrorEndpoint":
                    mockError = MockError.networkError
                case "serverErrorEndpoint":
                    mockError = MockError.serverError
                default:
                    mockError = MockError.parsingError
            }
            completionHandler(MovieDB_SwiftUI.NetworkResult.failure(mockError))
        }
    }
    
    func sendRequest<W>(req: W, completionHandler: @escaping (MovieDB_SwiftUI.NetworkResult<W.ResponseType>) -> Void) where W : MovieDB_SwiftUI.Requestable {
        if shouldSucceed {
            // Mock a successful response
            let mockData: Data = mockData ?? Data()
            let decoder = JSONDecoder()
            do {
                let object = try decoder.decode(W.ResponseType.self, from: mockData)
                completionHandler(MovieDB_SwiftUI.NetworkResult.success(object))
            } catch _ {
                completionHandler(MovieDB_SwiftUI.NetworkResult.failure(MockError.parsingError))
            }
        } else {
            // Mock a failure response with a specific error
            let mockError: Error
            switch req.endpoint {
                case "networkErrorEndpoint":
                    mockError = MockError.networkError
                case "serverErrorEndpoint":
                    mockError = MockError.serverError
                default:
                    mockError = MockError.parsingError
            }
            completionHandler(MovieDB_SwiftUI.NetworkResult.failure(mockError))
        }
    }
    
    
  
}
