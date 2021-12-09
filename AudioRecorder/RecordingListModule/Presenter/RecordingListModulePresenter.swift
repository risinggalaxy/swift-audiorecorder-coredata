//
//  MainPresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingLisModulePresenter: RecordingListModulePresenterProtocol {

    var view: RecordingListModuleViewProtocol?
    
    var interactor: RecordingListModuleInteractorInputProtocol?
    
    var wireFrame: RecordingListModuleWireFrameProtocol?
    
    func presentRecordingView(module: VIEW) {
        wireFrame?.shouldPresentRecordingView(module: module)
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]?) {
        if let recordings = persistedData {
            view?.reloadData(with: recordings)
        } else {
            //TODO: Notify view something went wrong
        }
    }
    
}
