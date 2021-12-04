//
//  MainWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit

class RecordingListWireFrameView: RecordingListModuleWireFrameProtocol {
    
//    static func shouldReturnView(navigationBuilder: (UIViewController) -> (UINavigationController)) -> VIEW {
//        let view = RecordingListModule()
//        let interactor = RecordingListInteractor()
//        let presenter = RecordingListPresenter()
//        let wireFrame = RecordingListWireFrameView()
//
//        view.presenter = presenter
//        interactor.presenter = presenter
//        presenter.view = view
//        presenter.interactor = interactor
//        presenter.wireFrame = wireFrame
//        view.title = "Recordings"
//
//        return navigationBuilder(view)
//
//    }
//
//    func shouldPresentRecordingView(view: VIEW){
//        view.present(RecorderModuleWireFrame.shouldReturnView(), animated: true, completion: nil)
//    }
    
    static func shouldReturnView() -> VIEW {
        let view = RecordingListModuleView()
        let interactor = RecordingListInteractor()
        let interactorOutput = RecordingListInteractorOutput()
        let presenter = RecordingLisModulePresenter()
        let wireFrame = RecordingListWireFrameView()
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactorOutput.presenter = interactor
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        view.title = view.viewTitle
    
        return view
        
    }
    
    func shouldPresentRecordingView(module: VIEW) {
        let recordingModule = NavigationGenerator.buildNavigation(rootView: RecorderModuleWireFrame.shouldReturnView(),
                                                             showNavigationBar: false, largeTitle: false)
        module.present(recordingModule, animated: true, completion: nil)
    }
    
}
