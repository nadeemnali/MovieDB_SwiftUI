//
//  ContentView.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MovieListView(viewModel: MovieListViewModel(apiManager: APIManager.sharedInstance))
    }
}

#Preview {
    ContentView()
}
