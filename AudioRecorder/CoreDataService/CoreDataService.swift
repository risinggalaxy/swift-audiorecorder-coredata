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
            if let error = error {
                try! self.errorHandler(error)
            }
        }
        return container
    }()
    
    public lazy var mainContext: NSManagedObjectContext = {
        return self.storeContainer.viewContext
    }()
    
    public func differentContext() -> NSManagedObjectContext {
        let newContext = storeContainer.newBackgroundContext()
        return newContext
    }
    
    public func saveContext() {
        saveContext(mainContext)
    }
    
    public func saveContext( _ context: NSManagedObjectContext ) {
        if context != mainContext {
            saveDifferentContext(context)
            return
        }
        
        context.perform { [weak self] in
            guard let strongSelf = self else { return }
            do {
                try context.save()
            } catch let error {
                try! strongSelf.errorHandler(error)
            }
        }
    }
    
    public func saveDifferentContext( _ context: NSManagedObjectContext ) {
        context.perform { [weak self] in
            guard let strongSelf = self else { return }
            do {
                try context.save()
            } catch let error {
                try! strongSelf.errorHandler(error)
            }
            strongSelf.saveContext(strongSelf.mainContext)
        }
    }
    
    @discardableResult
    public func errorHandler( _ error: Error ) throws -> Error {
        throw error
    }
}
