//
//  PlayerModulePresenterProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import AVFoundation

protocol PlayerModulePresenterProtocol {
    
    var view: PlayerModuleViewProtocol? { get set }
    var interactor: PlayerModuleInteractorInputProtocol? { get set }
    var wireFrame: PlayerModuleWireFrameProtocol? { get set }
    var audioPlayer: AVAudioPlayer? { get set }
    func prepareRecordingForView( _ recording: RecordingReplica )
    func stopPlaying()
}
