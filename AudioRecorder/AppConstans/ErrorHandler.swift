//
//  ErrorHandler.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 06/12/2021.
//

import Foundation

enum CoreDataErrorHandler: Error, Equatable {
    case filedToLoadManagedObjectContext
    case errorMessage( _ message: String)
    
    public static func ==(lhs: CoreDataErrorHandler, rhs: CoreDataErrorHandler) -> Bool {
        switch (lhs, rhs) {
        case (.filedToLoadManagedObjectContext, .filedToLoadManagedObjectContext):
            return true
        case (.errorMessage(_), .errorMessage(_)):
            return true
        default: return false
        }
    }
}

enum AudioRecorderObjectErrorHandler: Error, Equatable {
    case failedToInitialize
    case failedToStartRecording
    case failToStopRecording
    case errorMessage( _ message: String )
}

struct AudioTestData {
    static let data: Data = {
        let fileURL = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        let data = try! Data(contentsOf: fileURL)
        return data
    }()
}
