//
//  PlayerModuleWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation

class PlayerModuleWireFrame: PlayerModuleWireFrameProtocol {
    
    static func shouldReturnView() -> VIEW {
        
        let view = PlayerModuleView()
        let interactor = PlayerModuleInteractor()
        let interactorOutput = PlayerModuleInteractorOutput()
        let presenter = PlayerModulePresenter()
        let wireFrame = PlayerModuleWireFrame()
        view.title = view.viewTitle
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactorOutput.presenter = interactor
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        return view
        
    }
    
}
