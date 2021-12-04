//
//  MainViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation

protocol RecordingListModuleViewProtocol: AnyObject {
    
    var viewTitle: String! { get set }
    var presenter: RecordingListModulePresenterProtocol? { get set }
    func reloadData()
    
}
