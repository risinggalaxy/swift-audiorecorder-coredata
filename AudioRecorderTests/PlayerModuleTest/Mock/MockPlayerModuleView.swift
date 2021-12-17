//
//  MockPlayerModuleView.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 14/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockPlayerModuleView: PlayerModuleViewProtocol {
    
    var viewTitle: String!
    var playButtonImage: String?
    var displayErrorMessage: String?
    var presenter: PlayerModulePresenterProtocol?
    
}
