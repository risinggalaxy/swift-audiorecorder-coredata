//
//  MockedRecordingListModuleView.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 07/12/2021.
//

import Foundation
import UIKit
@testable import AudioRecorder

class MockedRecordingListModuleView: RecordingListModuleViewProtocol {

    var currentSelectedIndexPath: IndexPath?
    var viewTitle: String!
    var presenter: RecordingListModulePresenterProtocol?
    var recordings: [Recording]!
    
    var didReloadData: Bool = false
    var timesReloadDataWasCalled: Int = 0
    
    var displayErrorMessage: String?
    
    func reloadData( with recordings: [Recording] ) {
        didReloadData = true
        timesReloadDataWasCalled += 1
        self.recordings = recordings
    }
    
    func presentPlayerViewController(with indexPath: IndexPath) {
        presenter?.selectedIndexPath = indexPath
    }

    func append(_ recording: Recording) {}
    
    func removeRecording(at indexPath: IndexPath, completion: (() -> Void)) {
        currentSelectedIndexPath = indexPath
        completion()
    }
    
    func presentAlertController(_ recordingName: String, with recording: Recording, from indexPath: IndexPath) {
    }
    
    func swipeActionRemoveRecording(at indexPath: IndexPath) {
    }
    
    func swipeActionEditRecording(at indexPath: IndexPath) {
    }
    
    func swipeAction(title: String, imageName: String, with style: UIContextualAction.Style, and backgroundColor: UIColor, for indexPath: IndexPath, actionHandler: @escaping (() -> Void)) -> UIContextualAction {
        let action = UIContextualAction()
        return action
    }
    
    
}
