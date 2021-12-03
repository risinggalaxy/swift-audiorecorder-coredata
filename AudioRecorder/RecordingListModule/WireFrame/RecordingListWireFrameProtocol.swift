//
//  MainWireFrameProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import UIKit

typealias VIEW = UIViewController

protocol RecordingListViewWireFrameProtocol {
    
//    static func shouldReturnView(navigationBuilder: NavigationControllerGenerator ) -> VIEW
//    func shouldPresentRecordingView(module: VIEW)
    
    static func shouldReturnView() -> VIEW
    func shouldPresentRecordingView(module: VIEW)
    
}
