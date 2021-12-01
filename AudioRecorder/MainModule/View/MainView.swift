//
//  ViewController.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit

class MainView: UIViewController, MainViewProtocol {
    
    var presenter: MainPresenterProtocol? {
        didSet {
            print("Presenter Set")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
    }


}

