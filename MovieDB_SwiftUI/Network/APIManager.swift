//
//  APIManager.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

class APIManager: APIManagerProtocol {
  
    static let sharedInstance = APIManager()
    
    func request<T: Requestable>(req: T, completionHandler: @escaping (URLResponse?, Data?, Error?) -> Void) {
        
        let url = req.baseURL.appendingPathComponent(req.endpoint)
        let request = Network.prepareRequest(for: url, req: req)
        
        let defaultSession = URLSession(configuration: .default)
        defaultSession.dataTask(with: request) { data, response, error in
            completionHandler(response, data, error)
        }.resume()
        
    }
    
    func getAPIData<T: Requestable>(req: T, completionHandler: @escaping (NetworkResult<T.ResponseType>) -> Void)  {
        
        request(req: req) { response, data, error in
            
            if let error = error {
                completionHandler(NetworkResult.failure(error))
                return
            }
            
            //MARK: - Control Status Code
            let response = response as? HTTPURLResponse
            switch response?.statusCode ?? 0 {
                case 200...300 :
                    if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let object = try decoder.decode(T.ResponseType.self, from: data)
                            completionHandler(NetworkResult.success(object))
                        } catch _ {
                            completionHandler(NetworkResult.failure(error))
                        }
                    }
                default:
                    completionHandler(NetworkResult.failure(error))
            }
        }
    }
    
    func sendRequest<W: Requestable> (req: W,
                                      completionHandler: @escaping (NetworkResult<W.ResponseType>) -> Void ) {
        APIManager().getAPIData(req: req) { (result) in
            switch result {
            case .success(let response):
                completionHandler(NetworkResult.success(response))
            case .failure(let error):
                completionHandler(NetworkResult.failure(error))
            }
        }
    }
}

