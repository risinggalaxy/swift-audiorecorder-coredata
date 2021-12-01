//
//  MainPresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class MainPresenter: MainPresenterProtocol {
    
    var view: MainView?
    
    var interactor: MainInteractorInputProtocol? {
        didSet {
            print("Hello World")
        }
    }
    
    var wireFrame: MainViewWireFrameProtocol?
    
}
