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
    
    var hostView: VIEW? {
        didSet {
            print("Got the host")
        }
    }
    
    var selectedIndexPath: IndexPath? {
        didSet {
            if let indexPath = selectedIndexPath {
               passIndexPathToInteractor(indexPath)
            }
        }
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]?) {
        if let recordings = persistedData {
            view?.reloadData(with: recordings)
        } else {
            view?.displayErrorMessage = "Unable To Load Recordings 😩"
        }
    }
    
    func sendReceivedRecordingToWireFrame( _ recording: Recording) {
//        delegate?.sendDataAndPlay(recording)
    }
    
    func presentPlayerModule(on hostView: VIEW, with recording: Recording) {
        wireFrame?.presentPlayerModule(on: hostView, with: recording)
    }
    
    func presentRecorderModule(on hostView: VIEW) {
        wireFrame?.presentRecorderModule(on: hostView)
    }
    
    
    @discardableResult
    func passIndexPathToInteractor(_ indexPath: IndexPath) -> IndexPath {
        if let interactor = interactor {
            if let recording = interactor.sendSelectedRecordingToPresenter(indexPath),
                let view = hostView {
                presentPlayerModule(on: view, with: recording)
            }
        }
        return indexPath
    }
}
