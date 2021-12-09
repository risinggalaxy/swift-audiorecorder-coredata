//
//  MainPresenterProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

protocol RecordingListModulePresenterProtocol {
    
    var view: RecordingListModuleViewProtocol? { get set }
    var interactor: RecordingListModuleInteractorInputProtocol? { get set }
    var wireFrame: RecordingListModuleWireFrameProtocol? { get set }
    func presentRecordingView(module: VIEW)
    func pushPersistedDataToView( _ persistedData: [Recording]? )
    
}
