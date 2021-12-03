//
//  RecorderModuleWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit

class RecorderModuleWireFrame: RecorderModuleWireFrameProtocol {
    
    static func shouldReturnView() -> VIEW {
        
        let view = RecorderModuleView()
        let interactor = RecorderModuleInteractor()
        let presenter = RecorderModulePresenter()
        let wireFrame = RecorderModuleWireFrame()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        return view
        
    }
    
}

