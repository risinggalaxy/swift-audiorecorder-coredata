//
//  AudioTestData.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 21/12/2021.
//

import Foundation

// Audio data used only for UnitTesting
struct AudioTestData {
    static let data: Data = {
        let fileURL = Bundle.main.url(forResource: "sound", withExtension: "mp3")!
        let data = try! Data(contentsOf: fileURL)
        return data
    }()
}
