//
//  MainControllerWireFrame.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 01/12/2021.
//

import UIKit

typealias NavigationControllerGenerator = (UIViewController) -> (UINavigationController)

class NavigationGenerator: MainControllerWireFrameProtocol {
    
    static func buildNavigation(rootView: UIViewController) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController: rootView)
        navigationController.navigationBar.prefersLargeTitles = true
        
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
            UINavigationBar.appearance().standardAppearance = appearance
        }
        
        return navigationController
        
    }

}

