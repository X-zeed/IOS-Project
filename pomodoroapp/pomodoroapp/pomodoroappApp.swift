//
//  pomodoroappApp.swift
//  pomodoroapp
//
//  Created by Admin on 15/6/2567 BE.
//

import SwiftUI

@main
struct pomodoroappApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: TodoIteam.self)
    }
}
