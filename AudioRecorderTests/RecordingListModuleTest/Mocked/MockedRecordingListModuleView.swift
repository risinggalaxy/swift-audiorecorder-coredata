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
    
    func reloadData() {
    }
    
    
    
}
