//
//  MockedRecordingListViewWireFrameProtocol.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import Foundation
import CoreData
@testable import AudioRecorder

class MockRecordingListModulePresenter: RecordingListModulePresenterProtocol {
   
    var view: RecordingListModuleViewProtocol?
    var interactor: RecordingListModuleInteractorInputProtocol?
    var wireFrame: RecordingListModuleWireFrameProtocol?
    var selectedIndexPath: IndexPath? {
        didSet {
            didReceiveRequestToPresentPlayer = true
            timesReceiveRequestToPresentPlayer += 1
        }
    }
    
    var didPresentRecorderView: Bool = false
    var timesRecorderViewWasPresented: Int = 0
    
    var hostView: VIEW?
    
    var didPushData: Bool = false
    var timesDataWasPushed: Int = 0
    var persistedData: [Recording]?
    
    var didReceiveRequestToPresentPlayer: Bool = false
    var timesReceiveRequestToPresentPlayer: Int = 0
    
    var didReceiveUpdateNotification: Bool = false
    var timesUpdateNotificationWereReceived: Int = 0
    
    var recording: Recording?
    
    var notificationCenter: NotificationCenter!
    
    var observer: AnyObject?
    
    func presentPlayerModule(on hostView: VIEW, with recording: Recording) {
        didReceiveRequestToPresentPlayer = true
        timesReceiveRequestToPresentPlayer += 1
    }
    
    func presentRecorderModule(on hostView: VIEW) {
        didPresentRecorderView = true
        timesRecorderViewWasPresented += 1
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]? ) {
        didPushData = true
        timesDataWasPushed += 1
        self.persistedData = persistedData
    }
    
    func sendReceivedRecordingToWireFrame(_ recording: Recording) {
        self.recording = recording
     }
    
    func passIndexPathToInteractor( _ indexPath: IndexPath) -> IndexPath {
        return indexPath
    }
    
    func notificationUpdate() {
        didReceiveUpdateNotification = true
        timesUpdateNotificationWereReceived += 1
    }
    
    func askInteractorToDelete(_ recording: Recording) {
    }
    
    func update() {
    }
    
}
