//
//  CoreDataService.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 05/12/2021.
//

import Foundation
import CoreData

open class CoreDataService {
    
    public static let modelName: String = "AudioRecorder"
    
    public static let model: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: modelName, withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    public init() {}
    
    public lazy var storeContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: CoreDataService.modelName, managedObjectModel: CoreDataService.model)
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                //TODO: Make testable
                print("Error occurred while creating container ")
            }
        }
        return container
    }()
    
    public lazy var mainContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    
    public func saveContext() {
        saveContext(mainContext)
    }
    
    public func saveContext( _ context: NSManagedObjectContext ) {
        if context != mainContext {
            saveDifferentContext(context)
            return
        }
        
        context.perform {
            do {
                try context.save()
            } catch let err as NSError {
                //TODO: Make testable
                print("Error \(err) occurred while Saving")
            }
        }
    }
    
    public func saveDifferentContext( _ context: NSManagedObjectContext ) {
        context.perform {
            do {
                try context.save()
            } catch let err as NSError {
                //TODO: Make testable
                print("Error \(err) occurred while saving different context ")
            }
            self.saveContext(self.mainContext)
        }
    }

}
