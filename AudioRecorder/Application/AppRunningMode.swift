//
//  AppRunningMode.swift
//  AudioRecorder
//
//  Created by YASSER FARAHI on 21/12/2021.
//

import Foundation

/* A Singleton class that defines applications running mode
 its shared instance is always set to .real and will changes to .uitest
 during a UI-Test
 */
public class AppRunningMode {
    static var currentMode: RunningMode = .real
}

public enum RunningMode {
    case real, uiTest
}

