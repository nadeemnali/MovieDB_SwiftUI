//
//  APIManagerProtocol.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation

public protocol APIManagerProtocol {
    func request<T: Requestable>(req: T, completionHandler: @escaping (URLResponse?, Data?, Error?) -> Void)
    func getAPIData<T: Requestable>(req: T, completionHandler: @escaping (NetworkResult<T.ResponseType>) -> Void)
    func sendRequest<W: Requestable>(req: W, completionHandler: @escaping (NetworkResult<W.ResponseType>) -> Void)
}
