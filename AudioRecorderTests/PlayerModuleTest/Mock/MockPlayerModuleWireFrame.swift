//
//  MockPlayerModuleWireFrame.swift
//  AudioRecorderTests
//
//  Created by YASSER FARAHI on 14/12/2021.
//

import Foundation
@testable import AudioRecorder

class MockPlayerModuleWireframe: PlayerModuleWireFrameProtocol {
    
    
    static func shouldReturnView() -> VIEW {
        let view = VIEW()
        return view
    }
    
    static func shouldReturnView(with recording: Recording) -> VIEW {
        let view = VIEW()
        return view
    }
    
    
}
