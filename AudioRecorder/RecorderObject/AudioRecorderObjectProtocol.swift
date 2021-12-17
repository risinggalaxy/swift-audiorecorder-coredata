//
//  AudioRecorderObjectProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
import AVFoundation

protocol AudioRecorderObjectProtocol {
    
    var audioRecorder: AVAudioRecorder! { get set }
    var recordingSettings: [String: Int]! { get set }
    var recordingSession: AVAudioSession? { get set }
    var recordedTrack: Data? { get set }
    func shouldSetupAudioRecorder( _ recordingSession: AVAudioSession ) -> Bool
    func startRecording( _ recordingSession: AVAudioSession ) -> Bool
    func stopRecording( _ recordingSession: AVAudioSession ) -> Bool
    func recordingUrl() -> URL
    func shouldManageRecord( _ state: AudioRecorderState, _ recordingSession: AVAudioSession ) -> Data?
}
