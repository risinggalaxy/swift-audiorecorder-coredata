//
//  RecorderModulePresenterProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecorderModulePresenterProtocol {
    
    var view: RecorderModuleViewProtocol? { get set }
    var interactor: RecorderModuleInputInteractorProtocol? { get set }
    var wireFrame: RecorderModuleWireFrameProtocol? { get set }
    func startRecording()
    func stopRecording()
}

