//
//  MainWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit
import CoreData

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
        
        let getRecordings = GetRecordings(managedObjectContext: CoreDataService.sharedInstance.mainContext, coreDataService: CoreDataService.sharedInstance)
        let view = RecordingListModuleView()
        let interactor = RecordingListModuleInteractor(getRecordings)
        let interactorOutput = RecordingListInteractorOutput()
        let presenter = RecordingListModulePresenter()
        let wireFrame = RecordingListWireFrameView()
        view.presenter = presenter
        interactor.presenter = presenter
        interactorOutput.presenter = interactor
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        view.title = view.viewTitle
        interactorOutput.updateViewAtLaunch()
        return view
        
    }
    
    
    func presentPlayerModule(on hostView: VIEW, with recording: Recording) {
        let playerModule = NavigationGenerator.buildNavigation(rootView: PlayerModuleWireFrame.shouldReturnView(with: recording), showNavigationBar: false, largeTitle: false)
        hostView.present(playerModule, animated: true, completion: nil)
    }
    
    func presentRecorderModule(on hostView: VIEW) {
        let recorderModule = NavigationGenerator.buildNavigation(rootView: RecorderModuleWireFrame.shouldReturnView(),showNavigationBar: false, largeTitle: false)
        hostView.present(recorderModule, animated: true, completion: nil)
    }    
    
}
