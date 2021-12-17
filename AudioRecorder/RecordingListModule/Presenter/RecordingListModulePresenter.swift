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
    var notificationCenter: NotificationCenter!
    var observer: AnyObject?
    var didHandleUpdateNotification: Bool = false
    
    var hostView: VIEW? {
        didSet {
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
            view?.displayErrorMessage = "Unable to load data at this time 😩"
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

    func sendReceivedRecordingToWireFrame(_ recording: Recording) {
    }
    
    func notificationUpdate() {
        didHandleUpdateNotification = true
        guard let recording = interactor?.shouldSendLatestRecordingToPresenter() else  {
            view?.displayErrorMessage = "Something went wrong"
            return
        }
        view?.append(recording)
    }
    
    func askInteractorToDelete( _ recording: Recording) {
        //TODO:
        interactor?.delete(recording)
    }
    
    func update() {
        interactor?.update()
    }
}
