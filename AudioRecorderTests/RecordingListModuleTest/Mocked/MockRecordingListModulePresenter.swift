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

    var didPresentRecorderView: Bool = false
    var timesRecorderViewWasPresented: Int = 0
    
    var didPushData: Bool = false
    var timesDataWasPushed: Int = 0
    var persistedData: [Recording]?
    
    func presentRecordingView(module: VIEW) {
        didPresentRecorderView = true
        timesRecorderViewWasPresented += 1
    }
    
    func pushPersistedDataToView( _ persistedData: [Recording]? ) {
        didPushData = true
        timesDataWasPushed += 1
        self.persistedData = persistedData
    }
}
