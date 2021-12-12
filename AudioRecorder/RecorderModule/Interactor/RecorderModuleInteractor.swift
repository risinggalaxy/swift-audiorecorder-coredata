//
//  RecorderModuleInteractor.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

class RecorderModuleInteractor: RecorderModuleInputInteractorProtocol {
    
    var getRecording: GetRecordingsProtocol!
    var presenter: RecorderModulePresenterProtocol?
    
    required init( _ getRecording: GetRecordingsProtocol) {
        self.getRecording = getRecording
    }
    
    func persistRecording(_ data: Data) {
        _ = getRecording.addNewRecording(creationDate: Date(), data: data, title: "Recording [\(dateFormatter())]")
    }
    
    private func dateFormatter() -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale.current
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let date = Date()
        let formattedDate = formatter.string(from: date)
        return formattedDate
    }
    
}
