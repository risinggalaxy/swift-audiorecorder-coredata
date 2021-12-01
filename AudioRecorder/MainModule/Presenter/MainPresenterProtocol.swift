//
//  MainPresenterProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol MainPresenterProtocol {
    
    var view: MainView? { get set }
    var interactor: MainInteractorInputProtocol? { get set }
    var wireFrame: MainViewWireFrameProtocol? { get set }
    
}
