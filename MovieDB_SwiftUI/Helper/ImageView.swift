//
//  ImageView.swift
//  MovieDB_SwiftUI
//
//  Created by Nadeem Ali on 10/12/2023.
//

import Foundation
import SwiftUI

//Image view to load async image and from cache if present
struct ImageView: View {
    var urlString: String
    
    var imageCache = ImageCache.getImageCache()
    
    @ObservedObject var imageLoader = ImageLoader()
    @State var image : UIImage?
    
    var body: some View {
        ZStack() {
            if image == nil {
                ProgressView()
                    .onAppear() {
                        self.loadImage()
                    }
            }
            Image(uiImage: image ?? UIImage())
                .resizable()
                .onReceive(imageLoader.$data) { data in
                    guard let data = data else { return }
                    self.image = UIImage(data: data) ?? UIImage()
                }
        }
    }
    
    func loadImage() {
        if loadImageFromCache() {
            return
        }
        self.imageLoader.loadData(from: urlString)
    }
    
    func loadImageFromCache() -> Bool {
        
        guard let cacheImage = imageCache.get(forKey: urlString) else {
            return false
        }
        image = cacheImage
        return true
    }
    
    func getImageFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        DispatchQueue.main.async {
            guard let loadedImage = UIImage(data: data ?? Data()) else {
                return
            }
            self.imageCache.set(forKey: self.urlString, image: loadedImage)
            self.image = loadedImage
        }
    }
}
