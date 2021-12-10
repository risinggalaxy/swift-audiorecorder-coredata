//
//  MockedRecordingListModuleView.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 07/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockedRecordingListModuleView: RecordingListModuleViewProtocol {

   
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
    
    
}
