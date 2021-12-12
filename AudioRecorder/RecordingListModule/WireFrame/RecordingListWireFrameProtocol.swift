//
//  MainWireFrameProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit

typealias VIEW = UIViewController

protocol RecordingListModuleWireFrameProtocol {
    
//    static func shouldReturnView(navigationBuilder: NavigationControllerGenerator ) -> VIEW
//    func shouldPresentRecordingView(module: VIEW)
    
    static func shouldReturnView() -> VIEW
    func presentPlayerModule(on hostView: VIEW, with recording: Recording)
    func presentRecorderModule(on hostView: VIEW)
    func presentAlertController(on hostView: VIEW, with title: String, and message: String) 
    
}

extension RecordingListModuleWireFrameProtocol {
    static func shouldReturnView() -> VIEW {
        let view = VIEW()
        return view
    }
}
