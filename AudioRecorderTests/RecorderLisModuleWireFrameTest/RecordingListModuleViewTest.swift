//
//  TestRecordingListModuleWireFrame.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import XCTest
@testable import AudioRecorder

class RecordingListModuleViewTest: XCTestCase {
    
    var sut: RecordingListModuleView!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RecordingListModuleView()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }
    
    func testRecordingListModuleView_WhenTappedOnBarButtonItem_ShouldPresentRecorderView() {
        //Arrange
        let mockRecordingListModulePresenter = MockRecordingListModulePresenter()
        //Act
        sut.presenter = mockRecordingListModulePresenter
        sut.presentRecorderView()
        //Assert
        XCTAssertTrue(mockRecordingListModulePresenter.didPresentRecorderView)
        XCTAssertEqual(mockRecordingListModulePresenter.timesRecorderViewWasPresented, 1)
    }
    
    func testRecordingListModuleView_WhenViewLaunches_TitleShouldNotBeNil() {
        //Arrange
        //Act
        //Assert
        XCTAssertNotNil(sut.viewTitle)
    }
    
}
