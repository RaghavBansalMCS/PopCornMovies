//
//  DataController.swift
//  PopCornMovies
//
//  Created by Consultant on 8/21/23.
//

import Foundation
import CoreData

class DataController: ObservableObject{
    
    let container = NSPersistentContainer(name: "PopCornMovies")

        
    
    init(){
        container.loadPersistentStores { desc, error in
            if let error = error{
                print("Failed To Load Data \(error.localizedDescription)")
            }
        }
    }
    
    
    func save(context: NSManagedObjectContext){
        do{
            try context.save()
            print("Data Saved")
        }catch{
            print("We didnt save the data")
        }
    }
    
    func addNote  (id:Int,overview:String,posterPath:String,release_date:String,titleWithLanguage:String,vote_average:Double,context:NSManagedObjectContext){
        let entity = Entity(context: context)
        entity.id = Int64(id)
        entity.overview = overview
        entity.posterPath = posterPath
        entity.release_date = release_date
        entity.titleWithLanguage = titleWithLanguage
        entity.vote_average = vote_average
        context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        save(context: context)
    }
    

   
    
}
