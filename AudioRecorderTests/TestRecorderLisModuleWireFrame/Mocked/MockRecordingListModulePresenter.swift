//
//  MockedRecordingListViewWireFrameProtocol.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockRecordingListModulePresenter: RecordingListModulePresenterProtocol {
    
    var view: RecordingListModuleView?
    var interactor: RecordingListModuleInteractorInputProtocol?
    var wireFrame: RecordingListModuleWireFrameProtocol?

    var didPresentRecorderView: Bool = false
    var timesRecorderViewWasPresented: Int = 0
    
    func presentRecordingView(module: VIEW) {
        didPresentRecorderView = true
        timesRecorderViewWasPresented += 1
    }
    
}
