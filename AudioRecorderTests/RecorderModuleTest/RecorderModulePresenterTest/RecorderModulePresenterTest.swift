//
//  RecorderModulePresenterTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import XCTest
@testable import AudioRecorder

class RecorderModulePresenterTest: XCTestCase {
    
    var sut: RecorderModulePresenter!
    var interactor: MockRecorderModuleInteractor!
    var view: MockRecorderModuleView!
    
    override func setUp() {
        super.setUp()
        sut = RecorderModulePresenter()
        interactor = MockRecorderModuleInteractor()
        view = MockRecorderModuleView()
        sut.interactor = interactor
        sut.view = view
    }
    
    override func tearDown() {
        sut = nil
        interactor = nil
        view = nil
        super.tearDown()
    }
    
    func testRecorderModulePresenter_WhenRecordingStarts_RecordingSessionCategoryShouldBePlayAndRecord() {
        sut.startRecording()
        let categoryIsPlayAndRecord = sut.recordingSession.category
        XCTAssertEqual(categoryIsPlayAndRecord, .playAndRecord)
    }
    
    func testRecorderModulePresenter_WhenRecordingEnded_ShouldSendDataToInteractor() {
        sut.stopRecording()
        let didSendDataToInteractor = interactor.didPersistData
        let numberOfFunctionCalls = interactor.numberOfFunctionCalls
        XCTAssertTrue(didSendDataToInteractor)
        XCTAssertEqual(numberOfFunctionCalls, 1)
    }
    
}
