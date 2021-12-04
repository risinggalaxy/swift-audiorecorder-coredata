//
//  MainPresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingLisModulePresenter: RecordingListModulePresenterProtocol {
    
    var view: RecordingListModuleView?
    
    var interactor: RecordingListModuleInteractorInputProtocol?
    
    var wireFrame: RecordingListModuleWireFrameProtocol?
    
    func presentRecordingView(module: VIEW) {
        wireFrame?.shouldPresentRecordingView(module: module)
    }
    
}
