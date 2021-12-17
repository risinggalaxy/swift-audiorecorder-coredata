//
//  RecordingListInteractorOutput.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingListInteractorOutput: RecordingListModuleInteractorOutputProtocol {
    
    var presenter: RecordingListModuleInteractorInputProtocol?
    
    func updateViewAtLaunch() {
        _ = presenter?.shouldProvideAllPersistedDataAtAppLaunch()
    }
    
}
