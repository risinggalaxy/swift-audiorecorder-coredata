//
//  GetRecordings.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 05/12/2021.
//

import Foundation
import CoreData

/*
 Swift gives us a final keyword just for this purpose: when you declare a class as being final, no other class can inherit from it.
 This means they can't override your methods in order to change your behavior – they need to use your class the way it was written.
 */

public final class GetRecordings {
    
    let managedObjectContext: NSManagedObjectContext
    let coreDataContainer: CoreDataService
    
    public required init(managedObjectContext: NSManagedObjectContext, coreDataService: CoreDataService) {
        self.managedObjectContext = managedObjectContext
        self.coreDataContainer = coreDataService
    }

}
