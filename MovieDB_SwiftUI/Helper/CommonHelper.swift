//
//  CommonHelper.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

//Common string values
class CommonHelper {
    static let errorMessage = "Something went wrong! Please try again later"
    static let errorTitle = "Error"
    static let noResultsFound = "No Results found! Please try again later"
    static let itemListTitle = "Movie list"
    static let itemDetailTitle = "Movie Detail"
    static let defaultPosterSize = "w185"
    static let defaultBackdropSize = "w780"
}


extension View {
    func errorAlert(error: String, buttonTitle: String = "OK") -> some View {
        return alert(CommonHelper.errorTitle, isPresented: .constant(!error.isEmpty)) {
            Button(buttonTitle) {
                
            }
        } message: {
            Text(error)
        }
    }
}
