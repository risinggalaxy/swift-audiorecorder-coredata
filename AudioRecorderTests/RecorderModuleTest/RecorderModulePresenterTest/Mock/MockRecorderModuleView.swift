//
//  MockRecorderModuleView.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockRecorderModuleView: RecorderModuleViewProtocol {
    
    var viewTitle: String!
    var statusTitle: String!
    var presenter: RecorderModulePresenterProtocol?
    
    func startRecording() {
    }
    
    func stopRecording() {
    }
    
}
