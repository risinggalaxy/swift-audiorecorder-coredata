//
//  RecorderModulePresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecorderModulePresenter: RecorderModulePresenterProtocol {
    
    var view: RecorderModuleViewProtocol?
    var interactor: RecorderModuleInputInteractorProtocol?
    var wireFrame: RecorderModuleWireFrameProtocol?
    
}
