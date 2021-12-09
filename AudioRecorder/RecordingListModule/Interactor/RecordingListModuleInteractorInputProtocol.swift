//
//  MainInteractorInputProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

protocol RecordingListModuleInteractorInputProtocol {
    
    var presenter: RecordingListModulePresenterProtocol? { get set }
    var getRecording: GetRecordingsProtocol! { get set }
    func shouldProvideAllPersistedDataAtAppLaunch()
    func sendSelectedRecordingToPresenter( _ indexPath: IndexPath ) -> Recording?
    
}
