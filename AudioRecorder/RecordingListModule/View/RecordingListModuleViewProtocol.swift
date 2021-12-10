//
//  MainViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData

protocol RecordingListModuleViewProtocol: AnyObject {
    var viewTitle: String! { get set }
    var displayErrorMessage: String? { get set }
    var presenter: RecordingListModulePresenterProtocol? { get set }
    var recordings: [Recording]! { get set }
    func reloadData( with recordings: [Recording] )
    func presentPlayerViewController(with indexPath: IndexPath)
}
