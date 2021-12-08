//
//  MockAudioRecorderObjectTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
import AVFoundation

@testable import AudioRecorder

class MockAudioRecorderObjectTest: AudioRecorderObjectProtocol {

    var audioRecorder: AVAudioRecorder!
    
    var recordingSettings: [String : Int]!
    
    var recordingSession: AVAudioSession?
    
    var recordedTrack: Data?
    
    var timesCreatedAudioRecorder: Int = 0
    
    var timesStartedRecording: Int = 0
    
    var timesStoppedRecording: Int = 0
    
    var didCreateRecordedURL: Bool = false
    var timesCreateRecordedURL: Int = 0

    func shouldSetupAudioRecorder( _ recordingSession: AVAudioSession ) -> Bool {
        timesCreatedAudioRecorder += 1
        return true
    }
    
    @discardableResult
    func startRecording( _ recordingSession: AVAudioSession ) -> Bool {
        timesStartedRecording += 1
        return true
    }
    
    @discardableResult
    func stopRecording( _ recordingSession: AVAudioSession ) -> Bool {
        timesStoppedRecording += 1
        return true
    }
    
    func recordingUrl() -> URL {
        let url = URL(string: "")
        didCreateRecordedURL = true
        timesCreateRecordedURL += 1
        return url!
    }
    
    func shouldManageRecord(_ state: AudioRecorderState, _ recordingSession: AVAudioSession) -> Data? {
        switch state {
        case .started: startRecording(recordingSession)
            return nil
        case .stop: stopRecording(recordingSession)
            return nil
        }
    }
    
}
