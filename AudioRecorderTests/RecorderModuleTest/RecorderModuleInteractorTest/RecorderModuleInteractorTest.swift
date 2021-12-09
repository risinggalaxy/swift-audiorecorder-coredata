//
//  RecorderModuleInteractorTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import XCTest
import CoreData
@testable import AudioRecorder

class RecorderModuleInteractorTest: XCTestCase {
    
    var sut: RecorderModuleInteractor!
    var coreDataService: MockCoreDataService!
    var getRecording: MockGetRecordings!
    
    override func setUp() {
        super.setUp()
        coreDataService = MockCoreDataService()
        getRecording = MockGetRecordings(managedObjectContext: coreDataService.mainContext, coreDataService: coreDataService)
        sut = RecorderModuleInteractor(getRecording)
    }
    
    
    override func tearDown() {
        sut = nil
        coreDataService = nil
        getRecording = nil
        super.tearDown()
    }
    
    func testRecorderModuleInteractor_WhenRecordingEnded_ShouldPersistToCoreDataContainer() {
        let dataURL = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        let data = try! Data(contentsOf: dataURL)
        sut.persistRecording(data)
        let dataWasPersisted = try! getRecording.loadRecordings()?.first
        XCTAssertNotNil(dataWasPersisted)
        XCTAssertNotNil(dataWasPersisted?.title)
        XCTAssertNotNil(dataWasPersisted?.id)
        XCTAssertNotNil(dataWasPersisted?.creationDate)
        XCTAssertEqual(dataWasPersisted?.data, data)
    }
    
}
