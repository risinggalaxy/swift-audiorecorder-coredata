//
//  MainInteractor.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class MainInteractor: MainInteractorInputProtocol {
    
    var presenter: MainPresenterProtocol? {
        didSet {
            print("Hello World")
        }
    }
    
}
