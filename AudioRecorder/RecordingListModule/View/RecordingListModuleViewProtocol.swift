//
//  MainViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecordingListModuleViewProtocol {
    
    var viewTitle: String! { get set }
    var presenter: RecordingListModulePresenterProtocol? { get set }
    
}
