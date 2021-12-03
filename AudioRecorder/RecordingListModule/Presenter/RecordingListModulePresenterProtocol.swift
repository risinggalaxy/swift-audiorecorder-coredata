//
//  MainPresenterProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecordingListModulePresenterProtocol {
    
    var view: RecordingListModule? { get set }
    var interactor: RecordingListModuleInteractorInputProtocol? { get set }
    var wireFrame: RecordingListViewWireFrameProtocol? { get set }
    
    func presentRecordingView(module: VIEW)
    
}
