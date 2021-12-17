//
//  PlayerModuleInteractorOutputProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import CoreData

protocol PlayerModuleInteractorOutputProtocol {
    
    var presenter: PlayerModuleInteractorInputProtocol? { get set }
    func sendDataAndPlay( _ recording: Recording)
    
}
