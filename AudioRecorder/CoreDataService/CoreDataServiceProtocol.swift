//
//  CoreDataServiceProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 09/12/2021.
//

import Foundation
import CoreData

protocol CoreDataServiceProtocol {
    static var modelName: String { get }
    static var model: NSManagedObjectModel { get }
    var storeContainer: NSPersistentContainer { get set }
    var mainContext: NSManagedObjectContext { get set }
    func saveDifferentContext( _ context: NSManagedObjectContext )
    func saveContext( _ context: NSManagedObjectContext )
    func differentContext() -> NSManagedObjectContext
    func saveContext()
}
