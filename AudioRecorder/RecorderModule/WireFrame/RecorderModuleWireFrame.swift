//
//  RecorderModuleWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit
import CoreData

class RecorderModuleWireFrame: RecorderModuleWireFrameProtocol {
    
    static func shouldReturnView() -> VIEW {
        let getRecordings = GetRecordings(managedObjectContext: CoreDataService.sharedInstance.mainContext, coreDataService: CoreDataService.sharedInstance)
        let view = RecorderModuleView()
        let interactor = RecorderModuleInteractor(getRecordings)
        let interactorOutput = RecorderModuleInteractorOutput()
        let presenter = RecorderModulePresenter()
        let wireFrame = RecorderModuleWireFrame()
        
        view.presenter = presenter
        interactor.presenter = presenter
        interactorOutput.presenter = interactor
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireFrame = wireFrame
        view.title = view.viewTitle
        
        return view
        
    }
    
}

