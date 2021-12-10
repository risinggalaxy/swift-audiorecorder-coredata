//
//  PlayerModuleView.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import UIKit
import AVFoundation

class PlayerModuleView: UIViewController ,PlayerModuleViewProtocol {
 
    var viewTitle: String! = "Audio Player"
    var presenter: PlayerModulePresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = AppColors.backgroundColor
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        presenter?.stopPlaying()
    }
    

    
}
