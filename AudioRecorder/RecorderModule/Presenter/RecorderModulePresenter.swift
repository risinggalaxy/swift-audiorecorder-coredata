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
    var audioRecorderObject: AudioRecorderObject!
    var recordingSession: AVAudioSession!
    var notificationCenter: NotificationCenter
    
    init(notificationCenter: NotificationCenter = .default) {
        recordingSession = AVAudioSession.sharedInstance()
        audioRecorderObject = AudioRecorderObject(recordingSession: recordingSession)
        self.notificationCenter = notificationCenter
    }
    
    func startRecording() {
        audioRecorderObject.shouldManageRecord(.started, recordingSession)
    }
    
    func stopRecording() {
        if let data = audioRecorderObject.shouldManageRecord(.stop, recordingSession) {
            interactor?.persistRecording(data)
            notificationCenter.post(name: AppNotificationNames.finishedRecording, object: nil)
        }
    }
}
