//
//  AudioRecorderObject.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import UIKit
import AVFoundation

class AudioRecorderObject: AudioRecorderObjectProtocol {
    
    internal var audioRecorder: AVAudioRecorder!
    
    var recordingSettings: [String: Int]! = [AVSampleRateKey: 12000, AVFormatIDKey: Int(kAudioFormatMPEG4AAC), AVNumberOfChannelsKey: 2, AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue]
    
    internal var recordingSession: AVAudioSession?
    
    internal var recordedTrack: Data?
    
    init(recordingSession: AVAudioSession) {
        self.recordingSession = recordingSession
        shouldSetupAudioRecorder(recordingSession)
    }
    
    @discardableResult
    internal func shouldSetupAudioRecorder( _ recordingSession: AVAudioSession) -> Bool {
        do {
            try recordingSession.setCategory(.playAndRecord, mode: .spokenAudio, options: .defaultToSpeaker)
            try audioRecorder = AVAudioRecorder(url: recordingUrl(), settings: recordingSettings)
            return true
        } catch {
            try! audioRecorderObject(.failedToInitialize)
            return false
        }
    }
    
    internal func recordingUrl() -> URL {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = urls[0] as NSURL
        documentDirectory.removeAllCachedResourceValues()
        let recordingUrl = documentDirectory.appendingPathComponent("audio")
        return recordingUrl!
    }
    
    @discardableResult
    internal func startRecording( _ recordingSession: AVAudioSession ) -> Bool {
        do {
            try recordingSession.setActive(true)
            audioRecorder.record()
            return true
        } catch {
            _ = try? audioRecorderObject(.failedToStartRecording)
            return false
        }
    }
    
    @discardableResult
    internal func stopRecording( _ recordingSession: AVAudioSession ) -> Bool {
        audioRecorder.stop()
        do {
            try recordingSession.setActive(false)
            
        } catch {
            try! audioRecorderObject(.failToStopRecording)
        }
        shouldGetRecordedAudio()
        return true
    }
    
    @discardableResult
    internal func shouldManageRecord( _ state: AudioRecorderState, _ recordingSession: AVAudioSession) -> Data? {
        switch state {
        case .started:
            startRecording(recordingSession)
            return nil
        case .stop:
            stopRecording(recordingSession)
            return recordedTrack
        }
    }
    
    @discardableResult
     internal func shouldGetRecordedAudio() -> Bool {
         var audioTrack: Data?
         do {
             audioTrack = try Data(contentsOf: audioRecorder.url)
         } catch {
            _ =  try? audioRecorderObject(.errorMessage("while getting audio data"))
         }
         if let track = audioTrack {
             recordedTrack = track
             return true
         }
         return false
     }
    
    @discardableResult
    func audioRecorderObject(_ error: AudioRecorderObjectErrorHandler ) throws -> String {
        throw error
    }
    
}

enum AudioRecorderState {
    case started, stop
}

