//
//  RecorderModulePresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import AVFoundation

class RecorderModulePresenter: RecorderModulePresenterProtocol {
    
    var view: RecorderModuleViewProtocol?
    var interactor: RecorderModuleInputInteractorProtocol?
    var wireFrame: RecorderModuleWireFrameProtocol?
    
    private var audioRecorderObject: AudioRecorderObject!
    private let recordingSession = AVAudioSession.sharedInstance()
    
    func startRecording() {
        audioRecorderObject = AudioRecorderObject(recordingSession: recordingSession)
        audioRecorderObject.shouldManageRecord(.started, recordingSession)
    }
    
    func stopRecording() {
        //TODO: Stop Recording + Talk to interactor save recording
        if let data = audioRecorderObject.shouldManageRecord(.stop, recordingSession) {
            print("DATA: \(data)")
        }
    }
}
