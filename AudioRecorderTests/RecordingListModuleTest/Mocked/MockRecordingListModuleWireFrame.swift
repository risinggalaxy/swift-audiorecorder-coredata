//
//  MockRecordingListModuleWireFrame.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockRecordingListModuleWireFrame: RecordingListModuleWireFrameProtocol {

    var receivedAndWillPassView: Bool = false
    var timesFunctionWasCalled: Int = 0
    
    func presentPlayerModule(on hostView: VIEW, with recording: Recording) {
    }
    
    func presentRecorderModule(on hostView: VIEW) {
        receivedAndWillPassView = true
        timesFunctionWasCalled += 1
    }
    
}
