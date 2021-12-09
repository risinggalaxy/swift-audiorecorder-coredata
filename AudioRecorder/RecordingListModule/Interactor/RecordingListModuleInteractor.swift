//
//  MainInteractor.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

class RecordingListModuleInteractor: RecordingListModuleInteractorInputProtocol {
    
    var presenter: RecordingListModulePresenterProtocol?
    var getRecording: GetRecordingsProtocol!
    
    init( _ getRecording: GetRecordingsProtocol ) {
        self.getRecording = getRecording
    }
    
    func shouldProvideAllPersistedDataAtAppLaunch() {
        do {
            if let recordings = try getRecording.loadRecordings() {
                presenter?.pushPersistedDataToView(recordings)
            }
        } catch {
        }
    }
}
