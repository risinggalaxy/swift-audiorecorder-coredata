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
    var presenter: MockRecordingListModulePresenter!

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RecordingListModuleView()
        presenter = MockRecordingListModulePresenter()
        sut.presenter = presenter
    }

    override func tearDownWithError() throws {
        sut = nil
        presenter = nil
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
        XCTAssertNotNil(sut.viewTitle)
    }
    
    func testRecordingListModuleView_WhenRequested_ShouldPresentPlayerView() {
        let tableView = UITableView()
        let indexPath = IndexPath(item: 0, section: 0)
        sut.tableView(tableView, didSelectRowAt: indexPath)
        let didReceivePresentViewRequest = presenter.didReceiveRequestToPresentPlayer
        let timesReceivedRequest = presenter.timesReceiveRequestToPresentPlayer
        XCTAssertTrue(didReceivePresentViewRequest)
        XCTAssertEqual(timesReceivedRequest, 1)
    }
    
    func testRecordingListModuleView_WhenCalled_ShouldPresentPlayerView() {
        let indexPath = IndexPath(item: 0, section: 0)
        sut.presentPlayerViewController(with: indexPath)
        let didReceivePresentViewRequest = presenter.didReceiveRequestToPresentPlayer
        let timesReceivedRequest = presenter.timesReceiveRequestToPresentPlayer
        XCTAssertTrue(didReceivePresentViewRequest)
        XCTAssertEqual(timesReceivedRequest, 1)
    }
    
}
