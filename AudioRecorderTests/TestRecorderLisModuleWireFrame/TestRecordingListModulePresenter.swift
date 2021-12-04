//
//  TestRecordingListModulePresenter.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import XCTest
@testable import AudioRecorder

class TestRecordingListModulePresenter: XCTestCase {

    var sut: RecordingLisModulePresenter!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RecordingLisModulePresenter()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testRecordingListModulePresenter_WhenBarButtonItemTappedOnRecordingListModuleView_ShouldPresentRecorderView() {
        //Arrange
        let mockRecordingListModuleWireFrame = MockRecordingListModuleWireFrame()
        let view = VIEW()
        //Act
        sut.wireFrame = mockRecordingListModuleWireFrame
        sut.presentRecordingView(module: view)
        //Assert
        XCTAssertTrue(mockRecordingListModuleWireFrame.receivedAndWillPassView)
        XCTAssertEqual(mockRecordingListModuleWireFrame.timesFunctionWasCalled, 1)
    }

}
