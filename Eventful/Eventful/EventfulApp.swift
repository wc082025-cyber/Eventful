//
//  EventfulApp.swift
//  Eventful
//
//  Created by Chris Wahlberg on 03/03/2026.
//

import SwiftUI

@main
struct EventfulApp: App {
    @StateObject private var userStore = UserStore()
    @StateObject private var eventStore = EventStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userStore)
                .environmentObject(eventStore)
        }
    }
}
