//
//  MockRecorderModuleInteractor.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
import CoreData
@testable import AudioRecorder

class MockRecorderModuleInteractor: RecorderModuleInputInteractorProtocol {
    
    
    var coreDataService: CoreDataServiceProtocol!
    var getRecording: GetRecordingsProtocol!
    var presenter: RecorderModulePresenterProtocol?
    
    var didPersistData: Bool = false
    var numberOfFunctionCalls: Int = 0
    
    
    func persistRecording( _ data: Data ) {
        didPersistData = true
        numberOfFunctionCalls += 1
    }
    
    
}
