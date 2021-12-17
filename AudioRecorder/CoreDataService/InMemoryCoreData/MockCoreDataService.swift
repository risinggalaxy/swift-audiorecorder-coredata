//
//  MockCoreDataService.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 17/12/2021.
//

import Foundation
import CoreData

class MockCoreDataService: CoreDataService {
    
    static let mockCoreDataService = MockCoreDataService()
    
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


public class AppRunningMode {
    static var currentMode: RunningMode = .none
}

public enum RunningMode {
    case real, uiTest, none
}

