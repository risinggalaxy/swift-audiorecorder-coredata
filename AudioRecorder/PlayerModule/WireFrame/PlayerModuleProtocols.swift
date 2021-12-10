//
//  PlayerModuleProtocols.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import CoreData

protocol PlayerModuleWireFrameProtocol {
    
    static func shouldReturnView() -> VIEW
    
    static func shouldReturnView(with recording : Recording) -> VIEW
    
}
