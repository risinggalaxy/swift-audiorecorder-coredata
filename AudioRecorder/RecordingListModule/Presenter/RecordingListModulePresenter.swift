//
//  MainPresenter.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

class RecordingListModulePresenter: RecordingListModulePresenterProtocol {
    
    var view: RecordingListModuleViewProtocol?
    
    var interactor: RecordingListModuleInteractorInputProtocol?
    
    var wireFrame: RecordingListModuleWireFrameProtocol?
    
    var selectedIndexPath: IndexPath? {
        didSet {
            if let indexPath = selectedIndexPath {
                if let recording = interactor?.sendSelectedRecordingToPresenter(indexPath) {
                    sendReceivedRecordingToWireFrame(recording)
                }
            }
        }
    }
    
    weak var delegate: AudioRecorderDelegate?
    
    func presentNewView(newModule:PresentingNewModule, module: VIEW) {
        wireFrame?.shouldPresentRecordingView(newModule: newModule, module: module)
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]?) {
        if let recordings = persistedData {
            view?.reloadData(with: recordings)
        } else {
            //TODO: Notify view something went wrong
        }
    }
    
    func sendReceivedRecordingToWireFrame( _ recording: Recording) {
        delegate?.sendDataAndPlay(recording)
    }
    
}
