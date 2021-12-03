//
//  ViewController.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit

class RecordingListModule: UIViewController, RecordingListModuleViewProtocol {
    
    var viewTitle: String! = "Recordings"
    var presenter: RecordingListModulePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        view.backgroundColor = .systemIndigo
        
    }
    
    fileprivate func setupBarButtonItem() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.fill"), style: .plain, target: self, action: #selector(presentRecorderView))
        barButtonItem.tintColor = AppColors.recordButtonColor
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc fileprivate func presentRecorderView() {
        presenter?.presentRecordingView(module: self)
    }

}

