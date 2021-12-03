//
//  RecorderModuleView.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit

class RecorderModuleView: UIViewController, RecorderModuleViewProtocol {
    
    var viewTitle: String! = "Audio Recorder"
    var presenter: RecorderModulePresenterProtocol?
    
    override func viewDidLoad() {
        view.backgroundColor = .orange
    }
    
}
