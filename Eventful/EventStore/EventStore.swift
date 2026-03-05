//
//  EventStore.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//

import Foundation
import Combine

struct Event: Identifiable, Codable {
    let id: UUID
    let title: String
    let date: Date
}

final class EventStore: ObservableObject {
    
    @Published var events: [Event] = [] {
        didSet {save()}
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(data, forKey: "events")
        }
    }
    
    private func load() {
        if let data = UserDefaults.standard.data(forKey: "events"),
           let events = try? JSONDecoder().decode([Event].self, from: data) {
            self.events = events
        }
    }
    
} // final class
