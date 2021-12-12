//
//  AppColors.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 03/12/2021.
//

import Foundation
import UIKit

struct AppColors{
    
    static let dateStampColor = UIColor(named: "dateStamp")
    static let evenCellColor = UIColor(named: "evenCell")
    static let unEvenCellColor = UIColor(named: "unEvenCell")
    static let recordButtonColor = UIColor(named: "recordButton")
    static let titleColor = UIColor(named: "titleColor")
    static let backgroundColor = UIColor(named: "backgroundColor")
    static let recordButtonTitle = UIColor(named: "recordButtonTitle")
    static let editAction = UIColor(named: "editAction")
    static let deleteAction = UIColor(named: "deleteAction")
    
}

enum ReuseableCellIdentifier: String {
    case recordingCell = "recordingCell"
}
