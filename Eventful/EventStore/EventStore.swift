//
//  EventStore.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//

import Foundation
import Combine



final class EventStore: ObservableObject {
    
    @Published var events: [Event] = [] {
        didSet {save()}
    }
    
    init() {
        load()
    }
    
    private func save() {
        if let data = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(data, forKey: "events")
        }
    }
    
 private func load() {
     guard let data = UserDefaults.standard.data(forKey: "events"),
           let decoded = try? JSONDecoder().decode([Event].self, from: data) else {
         return
     }
self.events = decoded
    }
    
    
    // delete event
    
    func delete(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    
    // move event
    
    func move(from sourceIndex: Int, to destinationIndex: Int) {
        let movedEvent = events.remove(at: sourceIndex)
        events.insert(movedEvent, at: destinationIndex)
    }
    
} // final class
