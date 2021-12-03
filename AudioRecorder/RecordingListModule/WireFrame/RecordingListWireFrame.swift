//
//  MainWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit

class RecordingListWireFrameView: RecordingListViewWireFrameProtocol {
    
    static func shouldReturnView(navigationBuilder: (UIViewController) -> (UINavigationController)) -> VIEW {
        let view = RecordingListModule()
        let interactor = RecordingListInteractor()
        let presenter = RecordingListPresenter()
        let wireFrame = RecordingListWireFrameView()
        
        view.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        view.title = "Recordings"
    
        return navigationBuilder(view)
        
    }
    
    func shouldPresentRecordingView(module: VIEW){
        module.present(RecorderModuleWireFrame.shouldReturnView(), animated: true, completion: nil)
    }
    
}
