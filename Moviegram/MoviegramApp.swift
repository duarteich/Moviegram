//
//  MoviegramApp.swift
//  Moviegram
//
//  Created by Christyan Duarte on 23/07/24.
//

import SwiftUI

@main
struct MoviegramApp: App {
    @StateObject private var sessionManager = SessionManager()
    
    var body: some Scene {
        WindowGroup {
            if sessionManager.configuration != nil {
                ContentView()
                    .environmentObject(sessionManager)
            } else {
                LoadingView()
            }
        }
    }
}
