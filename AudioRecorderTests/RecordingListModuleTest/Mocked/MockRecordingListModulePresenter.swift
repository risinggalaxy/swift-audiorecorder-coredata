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
    var selectedIndexPath: IndexPath?
    
    var didPresentRecorderView: Bool = false
    var timesRecorderViewWasPresented: Int = 0
    
    var didPushData: Bool = false
    var timesDataWasPushed: Int = 0
    var persistedData: [Recording]?
    
    var didReceiveRequestToPresentPlayer: Bool = false
    var timesReceiveRequestToPresentPlayer: Int = 0
    
    var recording: Recording?
    
    func presentNewView(newModule:PresentingNewModule, module: VIEW) {
        if newModule == .recorder {
            didPresentRecorderView = true
            timesRecorderViewWasPresented += 1
        } else {
            didReceiveRequestToPresentPlayer = true
            timesReceiveRequestToPresentPlayer += 1
        }
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]? ) {
        didPushData = true
        timesDataWasPushed += 1
        self.persistedData = persistedData
    }
    
    func sendReceivedRecordingToWireFrame(_ recording: Recording) {
        self.recording = recording
     }
    
}
