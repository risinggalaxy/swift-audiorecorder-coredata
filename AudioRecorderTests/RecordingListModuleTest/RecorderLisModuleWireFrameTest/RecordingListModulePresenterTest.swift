//
//  TestRecordingListModulePresenter.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 04/12/2021.
//

import XCTest
@testable import AudioRecorder

class RecordingListModulePresenterTest: XCTestCase {

    var sut: RecordingListModulePresenter!
    var mockView: MockedRecordingListModuleView!
    var mockInteractor: MockRecordingListModuleInteractor!
    var mockWireFrame: MockRecordingListModuleWireFrame!
    
    override func setUp() {
        super.setUp()
        sut = RecordingListModulePresenter()
        mockView = MockedRecordingListModuleView()
        mockInteractor = MockRecordingListModuleInteractor()
        mockWireFrame = MockRecordingListModuleWireFrame()
        sut.view = mockView
        sut.interactor = mockInteractor
        sut.wireFrame = mockWireFrame
        mockView.presenter = sut
        mockInteractor.presenter = sut
        mockView.presenter = sut
    }
    
    override func tearDown() {
        mockView = nil
        mockInteractor = nil
        mockWireFrame = nil
        sut = nil
        super.tearDown()
    }
    
    func testRecordingListModulePresenter_WhenBarButtonItemTappedOnRecordingListModuleView_ShouldPresentRecorderView() {
        //Arrange
        let mockRecordingListModuleWireFrame = MockRecordingListModuleWireFrame()
        let view = VIEW()
        //Act
        sut.wireFrame = mockRecordingListModuleWireFrame
        sut.presentRecorderModule(on: view)
        //Assert
        XCTAssertTrue(mockRecordingListModuleWireFrame.receivedAndWillPassView)
        XCTAssertEqual(mockRecordingListModuleWireFrame.timesFunctionWasCalled, 1)
    }
    
    func testRecordingListModulePresenter_WhenAppLaunchProvidesData_ShouldBeCalledOnceAndTrue() {
        let recordings = try! mockInteractor.getRecording.loadRecordings()
        sut.pushPersistedDataToView(recordings)
        let didPushDataToView = mockView.didReloadData
        let timesReloadDataWasCalled = mockView.timesReloadDataWasCalled
        XCTAssertTrue(didPushDataToView)
        XCTAssertEqual(timesReloadDataWasCalled, 1)
        
    }
    
    func testRecordingListModulePresenter_WhenAppLaunchCanNotProvideData_ShouldBeCalledOnceAndFalse() {
        sut.pushPersistedDataToView(nil)
        let viewGotErrorMessage = mockView.displayErrorMessage
        XCTAssertNotNil(viewGotErrorMessage)
    }
    
    
    func testRecordingListModulePresenter_WhenIndexPathReceived_ShouldGetARecodingFromInteractor() {
        let recording = mockInteractor.getRecording.addNewRecording(creationDate: Date(), data: AudioTestData.data, title: "New Recording")
        sut.sendReceivedRecordingToWireFrame(recording)
        XCTAssertNotNil(recording)
    }
    
    
    func testRecordingListModulePresenter_WhenRequestForDisplayingPlayerViewIsReceived_SelectedIndexPathShouldNotBeNil() {
        let indexPath = IndexPath(item: 0, section: 0)
        mockView.presentPlayerViewController(with: indexPath)
        let selectedIndexPath = sut.selectedIndexPath
        XCTAssertNotNil(selectedIndexPath)
        XCTAssertEqual(selectedIndexPath, indexPath)
        
    }
    
    func testRecordingListModulePresenter_WhenNotificationSent_ShouldObserveNotification() {
        let notificationCenter = NotificationCenter()
        sut = RecordingListModulePresenter(notificationCenter: notificationCenter)
        XCTAssertFalse(sut.didHandleUpdateNotification)
        notificationCenter.post(name: AppNotificationNames.finishedRecording, object: nil)
        XCTAssertTrue(sut.didHandleUpdateNotification)
    }
    
    func testRecordingListModulePresenter_WhenDeleteRequested_ShouldReceiveAndPassRecoringToInteractor() {
        
//        sut.askInteractorToDelete(recording)
        
        
    }
    
}
