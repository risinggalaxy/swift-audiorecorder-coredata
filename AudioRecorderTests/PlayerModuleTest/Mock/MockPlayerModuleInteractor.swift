//
//  MockPlayerModuleInteractor.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 14/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockPlayerModuleInteractor: PlayerModuleInteractorInputProtocol {
    
    var presenter: PlayerModulePresenterProtocol?
    var recordingReplica: RecordingReplica?
    
}
