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
    
    func sendSelectedRecordingToPresenter(_ indexPath: IndexPath) -> Recording? {
        if let recordings = try! getRecording.loadRecordings() {
            let recording = recordings[indexPath.row]
            return recording
        } else {
            return nil
        }
    }
    
    func shouldSendLatestRecordingToPresenter() -> Recording? {
        guard let recording = try? getRecording.loadRecordings()?.first else {
            return nil
        }
        return recording
    }
}
