//
//  GetRecordingsProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
import CoreData

protocol GetRecordingsProtocol {
    var managedObjectContext: NSManagedObjectContext! { get set }
    var coreDataContainer: CoreDataServiceProtocol! { get set }
    func addNewRecording(creationDate: Date, data: Data, title: String) -> Recording
    func loadRecordings() throws -> [Recording]?
    func update()
    func update(_ recording: Recording) -> Recording
    func delete( _ recording: Recording)
}
