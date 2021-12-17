//
//  PlayerModulePresenterTest.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 14/12/2021.
//

import XCTest
@testable import AudioRecorder

class PlayerModulePresenterTest: XCTestCase {
    
    
    var sut: PlayerModulePresenter!
    
    override func setUp() {
        super.setUp()
        sut = PlayerModulePresenter()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
        
    }
    
    
    func testPlayerModulePresenter_WhenPausedPlayButtonImage_ShouldNotBeNil() {
        let recording = RecordingReplica(id: UUID(), title: "Test Recording", creationDate: Date(), data: AudioTestData.data)
        sut.prepareRecordingForView(recording)
        sut.playButtonHandler()
        sut.audioPlayer?.stop()
        XCTAssertNotNil(sut.playButtonImage)
        XCTAssertEqual(sut.playButtonImage, "play.fill")
    }
    
    
}
