//
//  MockCoreDataService.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 06/12/2021.
//

import Foundation
import CoreData
@testable import AudioRecorder

class MockCoreDataService: CoreDataService {
    override init() {
        super.init()
        let persistentStoreDescription = NSPersistentStoreDescription()
        persistentStoreDescription.type = NSInMemoryStoreType
        let container = NSPersistentContainer(name: CoreDataService.modelName, managedObjectModel: CoreDataService.model)
        container.persistentStoreDescriptions = [persistentStoreDescription]
        container.loadPersistentStores { _ , error in
            if let error = error as Error?  {
                print("An error occurred \(error)")
            }
        }
        storeContainer = container
    }
}
