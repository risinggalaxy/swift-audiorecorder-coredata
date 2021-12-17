//
//  MockPlayerModulePresenter.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 14/12/2021.
//

import Foundation
import AVFoundation
@testable import AudioRecorder

class MockPlayerModulePresenter: PlayerModulePresenterProtocol {
    
    var playButtonImage: String?
    var view: PlayerModuleViewProtocol?
    var interactor: PlayerModuleInteractorInputProtocol?
    var wireFrame: PlayerModuleWireFrameProtocol?
    var audioPlayer: AVAudioPlayer?
    
    func prepareRecordingForView(_ recording: RecordingReplica) {
    }
    
    func stopPlaying() {
    }
    
    func playButtonHandler() {
    }
    
    
}
