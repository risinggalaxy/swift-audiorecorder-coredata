//
//  PlayerModulePresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import AVFoundation

class PlayerModulePresenter: NSObject, AVAudioPlayerDelegate, PlayerModulePresenterProtocol {
    
    var view: PlayerModuleViewProtocol?
    var interactor: PlayerModuleInteractorInputProtocol?
    var wireFrame: PlayerModuleWireFrameProtocol?
    var audioPlayer: AVAudioPlayer?
    var playButtonImage: String? {
        didSet {
            guard let imageName = playButtonImage else {
                view?.displayErrorMessage = "Something went wrong"
                return
            }
            view?.playButtonImage = imageName
        }
    }
    
    func prepareRecordingForView( _ recording: RecordingReplica) {
        view?.viewTitle = recording.title
        do {
            audioPlayer = try AVAudioPlayer(data: recording.data)
            audioPlayer?.delegate = self
            audioPlayer?.play()
            playButtonImage = "pause.fill"
        } catch {
            view?.displayErrorMessage = "Something went wrong, while initializing Audio Player"
        }
    }
    
    
    func stopPlaying() {
        if audioPlayer != nil {
            audioPlayer?.stop()
            audioPlayer = nil
        }
    }
    
    func playButtonHandler() {
        guard let player = audioPlayer else {
            return
        }
        if player.isPlaying {
            player.pause()
            playButtonImage = "play.fill"
        } else {
            playButtonImage = "pause.fill"
            player.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        playButtonImage = "play.fill"
    }
    
}
