//
//  MainPresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingListPresenter: RecordingListModulePresenterProtocol {
    
    var view: RecordingListModule?
    
    var interactor: RecordingListModuleInteractorInputProtocol?
    
    var wireFrame: RecordingListViewWireFrameProtocol?
    
    func presentRecordingView(module: VIEW) {
        wireFrame?.shouldPresentRecordingView(module: module)
    }
    
}
