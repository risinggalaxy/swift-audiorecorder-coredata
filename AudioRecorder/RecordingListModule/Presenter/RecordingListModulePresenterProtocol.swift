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
    var selectedIndexPath: IndexPath? { get set }
    var delegate: AudioRecorderDelegate? { get set }
    
    func sendReceivedRecordingToWireFrame( _ recording: Recording )
    func presentNewView(newModule:PresentingNewModule, module: VIEW)
    func pushPersistedDataToView( _ persistedData: [Recording]? )
    
    
}
