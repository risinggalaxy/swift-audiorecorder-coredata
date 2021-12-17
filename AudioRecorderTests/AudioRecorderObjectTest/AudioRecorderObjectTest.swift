//
//  AudioRecorderObjectTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 08/12/2021.
//

import XCTest
import AVFoundation
@testable import AudioRecorder

class AudioRecorderObjectTest: XCTestCase {
    
    var sut: AudioRecorderObject!
    var recordingSession: MockAVSession!
    
    override func setUp() {
        super.setUp()
        recordingSession = MockAVSession()
        sut = AudioRecorderObject(recordingSession: recordingSession)
    }
    
    override func tearDown() {
        sut = nil
        recordingSession = nil
        super.tearDown()
    }
    
    func testAudioRecorderObject_WhenSetupAudioRecorder_CategoryShouldBePlayAndRecord() {
        sut.shouldSetupAudioRecorder(recordingSession)
        let didSetCategoryToPlayAndRecord = sut.recordingSession?.category == .playAndRecord ? true : false
        XCTAssertTrue(didSetCategoryToPlayAndRecord, "Category should be .playAndRecord but it is \(String(describing: sut.recordingSession?.category))")
    }
    
    func testAudioRecorderObject_WhenSetupAudioRecorderIfSuccess_ShouldReturnTrue() {
        let didReturnTrue = sut.shouldSetupAudioRecorder(recordingSession)
        XCTAssertTrue(didReturnTrue)
    }
    
    func testAudioRecorderObject_WhenRequestingRecordingURL_ShouldNotBeNil() {
        let didNotReturnNil = sut.recordingUrl()
        XCTAssertNotNil(didNotReturnNil)
    }
    
    func testAudioRecorderObject_WhenStartRecording_RecordingSessionShouldReturnTrue() {
        let didReturnTrue = sut.startRecording(recordingSession)
        XCTAssertTrue(didReturnTrue)
    }
    
    func testAudioRecorderObject_WhenStopRecording_RecordingSessionShouldReturnTrue() {
        let didReturnTrue = sut.stopRecording(recordingSession)
        XCTAssertTrue(didReturnTrue)
    }
    
    func testAudioRecorderObject_WhenStopRecordingForAudioTrack_ShouldReturnTrue() {
        let didReturnTrue = sut.shouldGetRecordedAudio()
        XCTAssertTrue(didReturnTrue)
    }
    
    func testAudioRecorderObject_WhenStartRecordingShouldManageMethod_ShouldReturnNil() {
        let didReturnNil = sut.shouldManageRecord(.started, recordingSession)
        XCTAssertNil(didReturnNil)
    }
    
    func testAudioRecorderObject_WhenEndedRecordingShouldManageMethod_ShouldReturnNotNil() {
        let didReturnNotNil = sut.shouldManageRecord(.stop, recordingSession)
        XCTAssertNotNil(didReturnNotNil)
    }
    
    func testAudioRecorderObject_SettingsShouldNotBeEmpty() {
        let isSettingsEmpty = sut.recordingSettings.isEmpty
        XCTAssertFalse(isSettingsEmpty)
    }
    
    func testAudioRecorderObject_WhenStartRecording_DataShouldBeNil() {
        sut.startRecording(recordingSession)
        XCTAssertNil(sut.recordedTrack)
    }
    
    func testAudioRecorderObject_WhenStopRecording_DataShouldNotBeNil() {
        sut.stopRecording(recordingSession)
        XCTAssertNotNil(sut.recordedTrack)
    }
    
}
