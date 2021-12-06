//
//  GetRecordings.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 05/12/2021.
//

import Foundation
import CoreData

/*
 When we declare a class as being final, no other class can inherit from it.
 Meaning other classes can not override the final methods in order to change its behavior – they must to use our class the way it was written.
 */

public final class GetRecordings {
    
    let managedObjectContext: NSManagedObjectContext
    let coreDataContainer: CoreDataService
    
    public required init(managedObjectContext: NSManagedObjectContext, coreDataService: CoreDataService) {
        self.managedObjectContext = managedObjectContext
        self.coreDataContainer = coreDataService
    }

}


extension GetRecordings {
    
    @discardableResult
    public func addNewRecording(creationDate: Date = Date(), data: Data, title: String) -> Recording {
        let recording = Recording(context: managedObjectContext)
        recording.id = UUID()
        recording.creationDate = creationDate
        recording.data = data
        recording.title = title
        coreDataContainer.saveContext(managedObjectContext)
        return recording
    }
    
    public func loadRecordings() -> [Recording]? {
        let fetchRequest: NSFetchRequest<Recording> = Recording.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Recording.creationDate), ascending: false)]
        
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            //TODO: Make testable
            print("Error while loading data \(error)")
        }
        
        return nil
    }
    
    
    @discardableResult
    public func update( _ recording: Recording ) -> Recording {
        coreDataContainer.saveContext(managedObjectContext)
        return recording
    }
    
    public func delete( _ recording: Recording) {
        managedObjectContext.delete(recording)
        coreDataContainer.saveContext(managedObjectContext)
    }

    
}
