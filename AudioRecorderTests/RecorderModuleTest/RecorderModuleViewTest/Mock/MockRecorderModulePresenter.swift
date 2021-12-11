//
//  MockRecorderModulePresenter.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockRecorderModulePresenter: RecorderModulePresenterProtocol {
    
    var notificationCenter: NotificationCenter
    var view: RecorderModuleViewProtocol?
    var interactor: RecorderModuleInputInteractorProtocol?
    var wireFrame: RecorderModuleWireFrameProtocol?
    
    var didStartRecording: Bool = false
    var numberOfSessionsStarted: Int = 0
    
    var didStopRecording: Bool = false
    var numberOfSessionsStopped: Int = 0
    
    init(notificationCenter: NotificationCenter = .default ) {
        self.notificationCenter = notificationCenter
    }
    
    func startRecording() {
        didStartRecording = true
        numberOfSessionsStarted += 1
    }
    
    func stopRecording() {
        didStopRecording = true
        numberOfSessionsStopped += 1
    }
}
