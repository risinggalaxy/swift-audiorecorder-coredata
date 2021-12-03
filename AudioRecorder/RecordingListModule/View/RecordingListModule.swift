//
//  ViewController.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit

class RecordingListModule: UIViewController, RecordingListModuleViewProtocol {
    
    var presenter: RecordingListModulePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        view.backgroundColor = .systemIndigo
        
    }
    
    fileprivate func setupBarButtonItem() {
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "circle.fill"), style: .plain, target: self, action: #selector(presentRecorderView))
        barButtonItem.tintColor = .red
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    
    @objc fileprivate func presentRecorderView() {
        presenter?.presentRecordingView(module: self)
    }

}

