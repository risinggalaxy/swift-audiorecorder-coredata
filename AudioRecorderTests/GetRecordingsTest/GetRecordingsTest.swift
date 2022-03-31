//
//  GetRecordingsTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 06/12/2021.
//

import XCTest
@testable import AudioRecorder

class GetRecordingsTest: XCTestCase {
    
    var sut: GetRecordings!
    var coreDataService: MockCoreDataService!
    var creationDate: Date!
    var testSoundFileUrl: URL!
    var recording: Recording!
    
    override func setUp() {
        super.setUp()
        coreDataService = MockCoreDataService()
        sut = GetRecordings(appMode: .real, managedObjectContext: coreDataService.mainContext, coreDataService: coreDataService)
        creationDate = Date()
    }
    
    override func tearDown() {
        creationDate = nil
        testSoundFileUrl = nil
        recording = nil
        coreDataService = nil
        sut = nil
        super.tearDown()
    }
    
    func testGetRecording_WhenDataGiven_ShouldCreateAnObject() {
        //Arrange
        creationDate = Date()
        recording = sut.addNewRecording(creationDate: creationDate, data: AudioTestData.data, title: "Test Recording")
        //Act
        //Assert
        XCTAssertNotNil(recording, "Recording should not be nil")
        XCTAssertNotNil(recording.id, "Recording ID should not be nil")
        XCTAssertNotNil(recording.data, "Recoding Data should not be nil")
        XCTAssertNotNil(recording.creationDate, "Recording creation data should not be nil")
        XCTAssertNotNil(recording.title, "Recording title should not be nil")
        XCTAssertTrue(recording.title == "Test Recording")
        XCTAssertTrue(recording.creationDate == creationDate)
        XCTAssertTrue(recording.data == AudioTestData.data)
    }
    
    func testGetRecording_WhenLaunched_ShouldLoadRecordings() {
        //Arrange
        
        recording = sut.addNewRecording(creationDate: creationDate, data: AudioTestData.data, title: "Test Recording")
        //Act
        let recordings = try! sut.loadRecordings()
        //Assert
        XCTAssertNotNil(recordings, "Recording must not be nil")
        XCTAssertTrue(recordings?.count == 1)
        XCTAssertTrue(recordings?.first?.id == recording.id)
        XCTAssertTrue(recordings?.first?.creationDate == recording.creationDate)
        XCTAssertTrue(recordings?.first?.data == recording.data)
    }
    
    func testGetRecordings_WhenTitleModified_UpdatesMustPersist() {
        //Arrange
        recording = sut.addNewRecording(creationDate: creationDate, data: AudioTestData.data, title: "Test Recording")
        //Act
        guard let updatingRecording = try!  sut.loadRecordings()?.first else { return }
        updatingRecording.title = "My New Update"
        _ = sut.update(updatingRecording)
        //Assert
        XCTAssertTrue(recording.title == updatingRecording.title)
    }
    
    func testGetRecordings_WhenRequested_RecordingShouldBeDeleted() {
        //Arrange
        recording = sut.addNewRecording(creationDate: creationDate, data: AudioTestData.data, title: "Test Recording")
        //Act
        var recordings = try! sut.loadRecordings()
        //Assert
        XCTAssertTrue(recordings?.count == 1)
        XCTAssertTrue(recordings?.first?.id == recording.id)
        sut.delete(recording)
        recordings = try! sut.loadRecordings()
        XCTAssertTrue(recordings?.isEmpty == true)
    }
    
    func testGetRecordings_WhenSomeThingIsWrongWithManagedObject_ShouldReturnAnError() {
        let error = CoreDataErrorHandler.errorMessage("An Error occurred")
        XCTAssertThrowsError(try coreDataService.errorHandler(error))
    }
    
    func testGetRecordings_WhenSavingAsync_ShouldPass() {
        //Arrange
        let differentContext = coreDataService.differentContext()
        sut = GetRecordings(appMode: .real, managedObjectContext: differentContext, coreDataService: coreDataService)
        //Act
        expectation(forNotification: .NSManagedObjectContextDidSave, object: coreDataService.mainContext) { _ in
            return true
        }
        differentContext.perform {
            let recording = self.sut.addNewRecording(data: Data(), title: "New Recording")
            XCTAssertNotNil(recording, "Recording must not be nil")
        }
        //Assert
        waitForExpectations(timeout: 2.0) { error in
            XCTAssertNil(error, "New recording was successfully persisted")
        }
    }

}
