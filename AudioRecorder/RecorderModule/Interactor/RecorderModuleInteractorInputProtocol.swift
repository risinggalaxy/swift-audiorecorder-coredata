//
//  RecorderModuleInteractorInputProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

protocol RecorderModuleInputInteractorProtocol {
    var presenter: RecorderModulePresenterProtocol? { get set }
    var getRecording: GetRecordingsProtocol! { get set }
    func persistRecording( _ data: Data )
}
