//
//  RecordingListInteractorOutput.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingListInteractorOutput: RecordingListInteractorOutputProtocol {
    
    var presenter: RecordingListModuleInteractorInputProtocol? {
        didSet {
            print("RecordingListInteractorOutputProtocol was set")
        }
    }
    
}