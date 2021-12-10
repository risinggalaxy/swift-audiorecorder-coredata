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
 
        presenter.view = view
        presenter.interactor = interactor
        interactorOutput.presenter = interactor
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.wireFrame = wireFrame
        
        return view
        
    }
    
    static func shouldReturnView(with recording : Recording) -> VIEW {
        let view = PlayerModuleView()
        let interactor = PlayerModuleInteractor()
        let interactorOutput = PlayerModuleInteractorOutput()
        let presenter = PlayerModulePresenter()
        let wireFrame = PlayerModuleWireFrame()
        view.title = view.viewTitle
 
        presenter.view = view
        presenter.interactor = interactor
        interactorOutput.presenter = interactor
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.wireFrame = wireFrame
        interactorOutput.sendDataAndPlay(recording)
        
        return view
    }
    
}
