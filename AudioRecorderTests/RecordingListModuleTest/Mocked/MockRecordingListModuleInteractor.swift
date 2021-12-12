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
    var InteractorOutPut: RecordingListInteractorOutput?
    
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
    
    func sendSelectedRecordingToPresenter(_ indexPath: IndexPath) -> Recording? {
        do {
            if let recordings = try getRecording.loadRecordings() {
                return recordings.first
            }
        } catch let error {
            _ = CoreDataErrorHandler.errorMessage(error.localizedDescription)
        }
        return nil
    }
    
    func shouldSendLatestRecordingToPresenter() -> Recording? {
        return nil
    }
    
    func delete(_ recording: Recording) {
    }
}
