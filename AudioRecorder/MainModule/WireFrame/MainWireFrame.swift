//
//  MainWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit

class MainWireFrameView: MainViewWireFrameProtocol {
    
    
    
    static func showMainViewController() -> VIEW {
        
        let view = MainView()
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let wireFrame = MainWireFrameView()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        
        return view
        
    }
    
    
    
    
}
