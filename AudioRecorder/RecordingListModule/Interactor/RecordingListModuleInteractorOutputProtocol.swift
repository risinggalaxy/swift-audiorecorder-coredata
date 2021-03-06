//
//  MainInteractorProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecordingListModuleInteractorOutputProtocol {
    
    var presenter: RecordingListModuleInteractorInputProtocol? { get set }
    func updateViewAtLaunch()
    
}
