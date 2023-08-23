//
//  PopCornMoviesApp.swift
//  PopCornMovies
//
//  Created by Consultant on 8/15/23.
//

import SwiftUI

@main
struct PopCornMoviesApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            //---------JailBroken
            if UIDevice.current.isJailBroken{
                ErrorView()
            }else{
                ContentView()
                    .environment(\.managedObjectContext, dataController.container.viewContext)
            }
            
           
        }
    }
}
