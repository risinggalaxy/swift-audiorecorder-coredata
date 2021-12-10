//
//  PlayerModuleViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import AVFoundation

protocol PlayerModuleViewProtocol {
    
    var viewTitle: String! { get set }
    var presenter: PlayerModulePresenterProtocol? { get set }
    
}
