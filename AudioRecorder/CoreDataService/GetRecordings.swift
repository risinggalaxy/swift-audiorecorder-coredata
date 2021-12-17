//
//  GetRecordings.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 05/12/2021.
//

import Foundation
import CoreData

public final class GetRecordings: GetRecordingsProtocol {
   
    var managedObjectContext: NSManagedObjectContext!
    var coreDataContainer: CoreDataServiceProtocol!
    
    public required init(appMode: RunningMode, managedObjectContext: NSManagedObjectContext = CoreDataService.sharedInstance.mainContext, coreDataService: CoreDataService = CoreDataService()) {
        switch appMode {
        case .real, .none:
            self.managedObjectContext = managedObjectContext
            self.coreDataContainer = coreDataService
        case .uiTest:
            self.managedObjectContext = MockCoreDataService.mockCoreDataService.mainContext
            self.coreDataContainer = MockCoreDataService()
        }
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
    
    public func loadRecordings() throws -> [Recording]? {
        let fetchRequest: NSFetchRequest<Recording> = Recording.fetchRequest()
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: #keyPath(Recording.creationDate), ascending: false)]
        do {
            let results = try managedObjectContext.fetch(fetchRequest)
            return results
        } catch let error as NSError {
            throw CoreDataErrorHandler.errorMessage("Error while loading data \(error)")
        }
    }
    
    public func update() {
        coreDataContainer.saveContext(managedObjectContext)
    }
    
    func update(_ recording: Recording) -> Recording {
        coreDataContainer.saveContext(managedObjectContext)
        return recording
    }
    
    
    public func delete( _ recording: Recording) {
        managedObjectContext.delete(recording)
        coreDataContainer.saveContext(managedObjectContext)
    }
}
