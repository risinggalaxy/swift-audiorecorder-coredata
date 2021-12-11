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
    
    var notificationCenter: NotificationCenter
    var observer: AnyObject?
    
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
    
    
    init(notificationCenter: NotificationCenter = .default ) {
        self.notificationCenter = notificationCenter
        self.observer = notificationCenter.addObserver(forName: AppNotificationNames.finishedRecording, object: nil, queue: .main, using: { [weak self] _ in
            self?.notificationUpdate()
        })
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]?) {
        if let recordings = persistedData {
            view?.reloadData(with: recordings)
        } else {
            view?.displayErrorMessage = "Unable To Load Recordings 😩"
        }
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

    func notificationUpdate() {
        guard let recordings = try? interactor?.getRecording.loadRecordings() else {
            view?.displayErrorMessage = "Something went wrong"
            return
        }
        
        view?.reloadData(with: recordings)
    }
    
}
