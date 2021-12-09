//
//  MockRecordingListInteractor.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 09/12/2021.
//

import Foundation
import CoreData
@testable import AudioRecorder

class MockRecordingListModuleInteractor: RecordingListModuleInteractorInputProtocol {
    
    var getRecording: GetRecordingsProtocol!
    var presenter: RecordingListModulePresenterProtocol?
    
    var didProvideOnAppLaunch: Bool = false
    var timesUpdateWasCalledAtLaunch: Int = 0
    
    init() {
        let coreDataService = MockCoreDataService()
        getRecording = MockGetRecordings(managedObjectContext: coreDataService.mainContext, coreDataService: coreDataService)
    }

    func shouldProvideAllPersistedDataAtAppLaunch(){
        didProvideOnAppLaunch = true
        timesUpdateWasCalledAtLaunch += 1
    }
    
}
