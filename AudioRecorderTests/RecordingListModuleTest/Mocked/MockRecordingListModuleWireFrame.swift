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
    
    func shouldPresentRecordingView(newModule:PresentingNewModule, module: VIEW) {
        receivedAndWillPassView = true
        timesFunctionWasCalled += 1
    }
    
}
