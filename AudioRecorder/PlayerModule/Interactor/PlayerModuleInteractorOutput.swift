//
//  PlayerModuleInteractorOutput.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import CoreData
import AVFoundation

class PlayerModuleInteractorOutput: PlayerModuleInteractorOutputProtocol {
    
    var presenter: PlayerModuleInteractorInputProtocol? {
        didSet {
        }
    }
    
    func sendDataAndPlay( _ recording: Recording) {
        guard let id = recording.id, let title = recording.title,
              let creationDate = recording.creationDate, let data = recording.data else {
                  //TODO: Notify Peresenter
                  return
              }
        let recordingReplica = RecordingReplica(id: id, title: title, creationDate: creationDate, data: data)
        presenter?.recordingReplica = recordingReplica
    }
    
}
