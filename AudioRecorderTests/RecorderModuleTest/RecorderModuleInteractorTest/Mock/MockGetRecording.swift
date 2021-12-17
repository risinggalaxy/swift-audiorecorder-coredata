//
//  MockGetRecording.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
import CoreData
@testable import AudioRecorder

class MockGetRecordings: GetRecordingsProtocol {
   
    var tempRecordingCopy: Recording?
    
    var managedObjectContext: NSManagedObjectContext!
    
    var coreDataContainer: CoreDataServiceProtocol!
    
    public required init(managedObjectContext: NSManagedObjectContext, coreDataService: CoreDataService) {
        self.managedObjectContext = managedObjectContext
        self.coreDataContainer = coreDataService
    }
    
    func addNewRecording(creationDate: Date, data: Data, title: String) -> Recording {
        let recording = Recording(context: managedObjectContext)
        recording.id = UUID()
        recording.creationDate = creationDate
        recording.data = data
        recording.title = title
        coreDataContainer.saveContext(managedObjectContext)
        return recording
    }
    
    func loadRecordings() throws -> [Recording]? {
        let fetchRequest: NSFetchRequest<Recording> = Recording.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Recording.creationDate), ascending: false)]
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            throw CoreDataErrorHandler.errorMessage("Error while loading data \(error)")
        }
    }
    
    fileprivate func testRecording() -> Recording {
        let recording = Recording(context: managedObjectContext)
        return recording
    }
    
    func update(_ recording: Recording) -> Recording {
        testRecording()
    }
    
    func delete(_ recording: Recording) {
    }
    
    func update() {
    }
    
}
