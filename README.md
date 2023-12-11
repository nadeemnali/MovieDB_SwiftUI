# MovieDB
This repo holds the code for MovieDB for a POC using MVVM - Swift Architecture.

## About App

This is a simple app which basically fetches a movie listing from the TheMovieDB API, and parses the JSON response into models which are `Codable` structs & ultimately displaying it in a ListView SwiftUI. 
Every item is a movie item which displays the details in a Cell. On tapping any of the item, user can get into the detail screen.

## Note for the Reviewers

**Covered most of the required activities**
- [x] Retrived data from the given endpoint 
- [x] Designed Movie listing screen
- [x] Designed Movie Detail screen
- [x] Dynamic URL for Images
- [x] Followed MVVM architecture
- [x] Unit test for ViewModels

**TODO**
- [] Expand the Unit test for different use cases
- [] Support for accessibilty unit tests


## Running the app

Once you have clonned the app to your local system, you can fire-up the app by opening _MovieDB_SwiftUI.xcodeproj_ file.

### Screenshots

![Simulator Screenshot - iPhone 15 Pro - 2023-12-11 at 12 07 32](https://github.com/nadeemnali/MovieDB_SwiftUI/assets/44068397/746cf00a-100f-408b-ae5c-436047c571cc)
![Simulator Screenshot - iPhone 15 Pro - 2023-12-11 at 12 07 34](https://github.com/nadeemnali/MovieDB_SwiftUI/assets/44068397/4e6a747c-ee2d-46fc-8aad-b9d5529b7d70)

