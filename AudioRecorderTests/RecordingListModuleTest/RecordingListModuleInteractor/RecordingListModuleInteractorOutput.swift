//
//  RecordingListModuleInteractorOutput.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 09/12/2021.
//

import XCTest
@testable import AudioRecorder

class RecordingListModuleInteractorOutputTest: XCTestCase {
    
    
    var sut: RecordingListInteractorOutput!
    var presenter: MockRecordingListModuleInteractor!
    
    override func setUp() {
        super.setUp()
        sut = RecordingListInteractorOutput()
        presenter = MockRecordingListModuleInteractor()
        sut.presenter = presenter
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        super.tearDown()
    }
    
    func testRecordingListModuleInteractorOutput_WhenLaunching_ShouldPushAllPersistedData() {
        sut.updateViewAtLaunch()
        let didCallUpdate = presenter.didProvideOnAppLaunch
        let timesUpdateWasCalled = presenter.timesUpdateWasCalledAtLaunch
        XCTAssertTrue(didCallUpdate)
        XCTAssertEqual(timesUpdateWasCalled, 1)
    }
    
    
}
