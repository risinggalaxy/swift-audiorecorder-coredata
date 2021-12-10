//
//  PlayerModuleInteractor.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation

class PlayerModuleInteractor: PlayerModuleInteractorInputProtocol {
    
    var presenter: PlayerModulePresenterProtocol?
    
    var recordingReplica: RecordingReplica? {
        didSet {
            if let recording = recordingReplica {
                presenter?.prepareRecordingForView(recording)
            }
        }
    }
    
    
}
