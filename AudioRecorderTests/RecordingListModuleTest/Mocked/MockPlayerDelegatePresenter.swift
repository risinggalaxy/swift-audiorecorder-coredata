//
//  MockAudioPlayerDelegateView.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 10/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockPlayerDelegatePresenter: PlayerModuleInteractorOutput {
    
    
    var didReceiveRecording: Bool = false
    var timesDelegateReceivedRecording: Int = 0
    var recordingData: Data?
    
    
    override func sendDataAndPlay(_ recording: Recording) {
        super.sendDataAndPlay(recording)
        didReceiveRecording = true
        timesDelegateReceivedRecording += 1
        recordingData = recording.data
    }
    
}
