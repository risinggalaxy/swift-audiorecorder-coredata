//
//  RecorderModuleViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecorderModuleViewProtocol {
    
    var viewTitle: String! { get set }
    var presenter: RecorderModulePresenterProtocol? { get set }
    
}
