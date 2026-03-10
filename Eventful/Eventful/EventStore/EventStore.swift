//
//  EventStore.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//
import Foundation
import Combine

final class EventStore: ObservableObject {
    // This holds EVERY event in the app
    @Published var allEvents: [Event] = [] {
        didSet { save() }
    }
    
    init() {
        load()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(allEvents) {
            // Changed the key slightly so we don't load the old corrupted data
            UserDefaults.standard.set(data, forKey: "all_events_db")
        }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: "all_events_db"),
              let decoded = try? JSONDecoder().decode([Event].self, from: data) else {
            return
        }
        self.allEvents = decoded
    }
    
    // MARK: - Safe Methods for Views to Use
    
    // Use this to get only the events for the currently logged-in user
    func events(for userId: UUID?) -> [Event] {
        guard let userId = userId else { return [] }
        return allEvents.filter { $0.ownerId == userId }
    }
    
    func addEvent(_ event: Event) {
        allEvents.append(event)
    }
    
    func deleteEvent(withId id: UUID) {
        allEvents.removeAll { $0.id == id }
    }
}
