//
//  AppDelegate.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 29/11/2021.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if ProcessInfo.processInfo.arguments.contains("UITEST") {
            testRecording()
        } else {
            AppRunningMode.currentMode = .real
        }
        return true
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    //This method gets executed only when running UITest
    fileprivate func testRecording() {
        AppRunningMode.currentMode = .uiTest
        let testRecording = Recording(context: MockCoreDataService.mockCoreDataService.mainContext)
        testRecording.id = UUID()
        testRecording.title = "Test Recording"
        testRecording.data = AudioTestData.data
        testRecording.creationDate = Date()
        CoreDataService.sharedInstance.saveContext(MockCoreDataService.mockCoreDataService.mainContext)
    }
}
  
