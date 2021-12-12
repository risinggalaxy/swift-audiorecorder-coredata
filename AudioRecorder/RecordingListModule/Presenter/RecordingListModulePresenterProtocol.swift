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
    var hostView: VIEW? { get set }
    var notificationCenter: NotificationCenter! { get set }
    var observer: AnyObject? { get set }
    func sendReceivedRecordingToWireFrame( _ recording: Recording )
    func presentPlayerModule(on hostView: VIEW, with recording: Recording)
    func presentRecorderModule(on hostView: VIEW)
    func pushPersistedDataToView( _ persistedData: [Recording]? )
    func passIndexPathToInteractor( _ indexPath: IndexPath ) -> IndexPath
    func notificationUpdate()
    func askInteractorToDelete( _ recording: Recording)
    func update()
}
