//
//  RecordingLisrModuleInteractorTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 09/12/2021.
//

import XCTest
import CoreData
@testable import AudioRecorder

class RecordingListModuleInteractorTest: XCTestCase {
    
    var sut: RecordingListModuleInteractor!
    var getRecording: MockGetRecordings!
    var coreDataService: MockCoreDataService!
    var presenter: MockRecordingListModulePresenter!
    
    override func setUp() {
        super.setUp()
        coreDataService = MockCoreDataService()
        getRecording = MockGetRecordings(managedObjectContext: coreDataService.mainContext, coreDataService: coreDataService)
        presenter = MockRecordingListModulePresenter()
        sut = RecordingListModuleInteractor(getRecording)
        sut.presenter = presenter
        
    }
    
    override func tearDown() {
        sut = nil
        presenter = nil
        getRecording = nil
        coreDataService = nil
        super.tearDown()
    }
    
    func testRecordingListModuleInteractor_WhenAppLaunch_ShouldPushAllPersistData() {
        sut.shouldProvideAllPersistedDataAtAppLaunch()
        presenter.pushPersistedDataToView(try! sut.getRecording.loadRecordings()!)
        let didPushData = presenter.didPushData
        let timesDataWasPushed = presenter.timesDataWasPushed
        let persistedData = presenter.persistedData
        XCTAssertTrue(didPushData)
        XCTAssertEqual(timesDataWasPushed, 2)
        XCTAssertNotNil(persistedData)
    }
    
}
