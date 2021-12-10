//
//  PlayerModulePresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import AVFoundation

class PlayerModulePresenter: PlayerModulePresenterProtocol {
    
    var view: PlayerModuleViewProtocol?
    var interactor: PlayerModuleInteractorInputProtocol?
    var wireFrame: PlayerModuleWireFrameProtocol?
    var audioPlayer: AVAudioPlayer?
    
    func prepareRecordingForView(_ recording: RecordingReplica) {
        view?.viewTitle = recording.title
        do {
            audioPlayer = try AVAudioPlayer(data: recording.data)
            audioPlayer?.play()
        } catch {
        }
    }
    
    func stopPlaying() {
        if audioPlayer != nil {
            audioPlayer?.stop()
            audioPlayer = nil
        }
    }
    
}
