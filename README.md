# SwiftUIAccessibility

    - This is an iOS app that displays a list of Movies and their information. The app is written in SwiftUI and uses MVVM architecture.
    - This Application uses multiple API Calls to show Movies which are [Now Playing, UpComing, Trending].
    
    

## Project Description 

    - This Application uses multiple API Calls to show Movies which are [Now Playing, UpComing, Trending].
    - This Application also has 5 Pages ->
                              - HomePage -> Displaying Movies[Now Playing, UpComing, Trending] with Search ability
                              - FavouritesPage -> Here the favourite movies of user can be stored from the detailedView of movies
                              - DetailedView -> Its the Detail View of the movies
                              - SeatsView -> Which is in the Detailed View to give a feeling of booking a ticket for the movie
                              - TicketView -> It shows a ticket kind of View which has all details that are available on the ticket
                                              It has a save option on this view which stores the ticket in the photos of the simulator
    - API Website - https://www.themoviedb.org 

## Table of Contents

   - In the structure files contains: Model, View, ViewModel, Network, CoreData and Tests. 
   - Model -> Its the dataModel which I used to get the data from API and display on the views
   - View  -> It shows the Views of my Application, how every page of the application will look
   - ViewModel -> It Communicates with the Network to fetch the data and pass on to the View
   - Network -> It is used to get the API Calls to get the data to pass to the ViewModel
   - CoreData -> It is used to store some data in offline Storage
   - Tests ->  Tests contains ViewModelTests


# Installation
   Can be used with Xcode 14.3 and above. Compatible with iPhone and iPad with minimum iOS version 16.0.

# Framework
   - SwiftUI 
   - Alamofire
   - CoreData
   - AlertToast
   - Image Caching(NSCache), AysncImage
   

# Architecture
   - MVVM- This application uses MVVM for the views and Alamofire for the URL calls.

# Offline Storage
  - Core Data -> The use of Core Data is On the Home Page to Store movie data of whichever movie the user want to save.

# Security 
    Implemeantaion
    1. Jailbroke detection

    - iOS Security options Discussion:
         1.Data Storage Security
         2.Network layer Security
         3.Jailbroken Detection
         4.Development techniques or best practices
         5.Code secuirty scans using blackduck sites

# Design Patterns
    - Singleton - It is used in the View Model to use the generic Network Manager in distinct functions attached to distinct data models and API Calls

# Testing
    TDD:
    Units tests for success and failure situations. Faked responses using FakeNetworkManager using test jsons. Written test cases for view model testing
    BDD:
    Also have written test cases using Qucik and Nimble framework
    for ViewModel

# Accessibility
   1. Added accessiblity for Voice Over and Dynamic fonts using accessiblityLabel,accessiblityValue,accessiblityTrait,accessiblityHint

# Screenshots

![github-small](https://i.postimg.cc/QxxJS7kt/Screenshot-2023-08-22-at-4-46-20-PM.png)
![github-small](https://i.postimg.cc/3N9CYr7Y/Screenshot-2023-08-22-at-4-46-36-PM.png)
![github-small](https://i.postimg.cc/BnjcfGzf/Screenshot-2023-08-22-at-4-47-07-PM.png)
![github-small](https://i.postimg.cc/k4mxSRg7/Screenshot-2023-08-22-at-4-46-05-PM.png)
![github-small](https://i.postimg.cc/RF7LpQD3/Screenshot-2023-08-22-at-4-45-26-PM.png)
![github-small](https://i.postimg.cc/2SgdzKpb/Screenshot-2023-08-22-at-4-45-44-PM.png)
![github-small](https://i.postimg.cc/bvbxd986/Screenshot-2023-08-22-at-4-47-17-PM.png)



