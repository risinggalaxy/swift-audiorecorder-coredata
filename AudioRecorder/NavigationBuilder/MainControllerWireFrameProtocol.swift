//
//  MainControllerWireFrameProtocol.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit

protocol MainControllerWireFrameProtocol {
//    static func buildNavigation(rootView: UIViewController) -> UINavigationController
    static func buildNavigation(rootView: UIViewController, showNavigationBar: Bool, largeTitle: Bool) -> UINavigationController
}

