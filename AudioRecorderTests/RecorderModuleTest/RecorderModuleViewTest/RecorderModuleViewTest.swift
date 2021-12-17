//
//  RecorderModuleViewTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import XCTest
@testable import AudioRecorder

class RecorderModuleViewTest: XCTestCase {
    
    var sut: RecorderModuleView!
    var presenter: MockRecorderModulePresenter!
    
    override func setUp() {
        super.setUp()
        sut = RecorderModuleView()
        presenter = MockRecorderModulePresenter()
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    func testRecorderModuleView_WhenViewLaunches_ShouldStratRecording() {
        sut.startRecording()
        let didStartRecording = presenter.didStartRecording
        let numberOfSessionsStarted = presenter.numberOfSessionsStarted
        XCTAssertTrue(didStartRecording)
        XCTAssertEqual(numberOfSessionsStarted, 1)
    }
    
    func testRecordingModuleView_WhenViewDisappears_ShouldStopRecording() {
        sut.stopRecording()
        let didStopRecording = presenter.didStopRecording
        let numberOfSessionStopped = presenter.numberOfSessionsStopped
        XCTAssertTrue(didStopRecording)
        XCTAssertEqual(numberOfSessionStopped, 1)
    }
    
    func testRecordingModuleView_WhenTappedOnRecordStopButton_ShouldStopRecording() {
        sut.stopRecordButtonWasTapped()
        let didStopRecording = presenter.didStopRecording
        let numberOfSessionStopped = presenter.numberOfSessionsStopped
        XCTAssertTrue(didStopRecording)
        XCTAssertEqual(numberOfSessionStopped, 1)
    }
    
}
