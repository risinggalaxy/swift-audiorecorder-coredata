//
//  AudioRecorderUITestsLaunchTests.swift
//  AudioRecorderUITests
//
//  Created by YASSER FARAHI on 17/12/2021.
//

import XCTest
@testable import AudioRecorder

class AudioRecorderUITestsLaunchTests: XCTestCase {

    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        app = XCUIApplication()        
    }
    
    override func tearDown() {
        super.tearDown()
        app = nil
    }
    
    func testAudioRecorderUI() {
        app.launchArguments.append("UITEST")
        app.launch()
        let tableView = app.tables
        let recordingCell = tableView.cells.containing(.staticText, identifier:"Test Recording")
        
        let recording = app.tables.staticTexts["Test Recording"]
        XCTAssertTrue(recording.exists)
        recording.tap()
        
        let playerNavigationTitle = app.navigationBars["Test Recording"].staticTexts["Test Recording"]
        XCTAssertTrue(playerNavigationTitle.exists)
        
        let pauseButton = app.buttons["pause"]
        XCTAssertTrue(pauseButton.exists)
        pauseButton.tap()
        
        let playButton = app.buttons["play"]
        XCTAssertTrue(playButton.exists)
        playButton.tap()
        
        let playerView = app.children(matching: .window).element(boundBy: 0)
        playerView.swipeDown(velocity: .fast)
        
        recordingCell.element.swipeRight(velocity: .fast)
        tableView/*@START_MENU_TOKEN@*/.buttons["Edit"]/*[[".cells.buttons[\"Edit\"]",".buttons[\"Edit\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let editAlert = app.alerts["Editing"]
        XCTAssertTrue(editAlert.exists)

        let textField = editAlert.textFields.firstMatch
        XCTAssertTrue(textField.exists)
        textField.tap()
        
        let recordingTitle = "Test Recording"
        let modifiedRecordingTitle = "UI TESTING - RECORDER APP"
        
        let deletingTitle = String(repeating: XCUIKeyboardKey.delete.rawValue, count: recordingTitle.count)
        
        textField.typeText(deletingTitle)
        
        textField.typeText(modifiedRecordingTitle)
        
        let doneButton = editAlert.buttons["Done"]
        XCTAssertTrue(doneButton.exists)
        doneButton.tap()
        
        let mainNavigationTitle = app.navigationBars["Recordings"].staticTexts["Recordings"]
        XCTAssertTrue(mainNavigationTitle.exists)
        
        let modifiedRecordingCell = tableView.cells.containing(.staticText, identifier:modifiedRecordingTitle)
        
        modifiedRecordingCell.element.swipeLeft(velocity: .fast)
        tableView.buttons["Remove"].tap()

        let addButton = app.buttons["add"]
        XCTAssertTrue(addButton.exists)
        
        let circleTabBarButton = app.navigationBars["Recordings"].buttons["Circle"]
        XCTAssertTrue(circleTabBarButton.exists)
        circleTabBarButton.tap()
        
        let recorderButton = app.buttons["RecordingButton"]
        XCTAssertTrue(recorderButton.exists)
        
        let recorderNavigationTitle = app.navigationBars["Audio Recorder"].staticTexts["Audio Recorder"]
        XCTAssertTrue(recorderNavigationTitle.exists)
        
        let recorderStatusLabel = app.staticTexts["Recording"]
        XCTAssertTrue(recorderStatusLabel.exists)
        
        recorderButton.tap()
        
    }
}
