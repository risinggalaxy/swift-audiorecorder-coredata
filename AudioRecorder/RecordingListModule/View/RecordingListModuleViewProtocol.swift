//
//  MainViewProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import Foundation
import CoreData
import UIKit

protocol RecordingListModuleViewProtocol {
    var viewTitle: String! { get set }
    var displayErrorMessage: String? { get set }
    var presenter: RecordingListModulePresenterProtocol? { get set }
    var recordings: [Recording]! { get set }
    var currentSelectedIndexPath: IndexPath? { get set}
    func reloadData( with recordings: [Recording] )
    func append( _ recording: Recording )
    func presentPlayerViewController(with indexPath: IndexPath)
    func removeRecording(at indexPath: IndexPath, completion: (() -> Void))
    func presentAlertController( _ recordingName: String, with recording: Recording, from indexPath: IndexPath)
    func swipeActionRemoveRecording( at indexPath: IndexPath )
    func swipeActionEditRecording(at indexPath: IndexPath ) 
    func swipeAction(title: String, imageName: String, with style: UIContextualAction.Style, and backgroundColor: UIColor, for indexPath: IndexPath, actionHandler: @escaping (() -> Void)) -> UIContextualAction 
}
