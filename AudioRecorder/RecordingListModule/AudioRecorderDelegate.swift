//
//  AudioRecorderDelegate.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 09/12/2021.
//

import Foundation
import CoreData

protocol AudioPlayerDelegateProtocol {
    func sendDataAndPlay( _ recording: Recording )
}
