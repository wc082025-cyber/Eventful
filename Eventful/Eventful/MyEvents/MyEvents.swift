//
//  MyEvents.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//

import SwiftUI


struct MyEvents: View {
    @EnvironmentObject var eventStore: EventStore
    @EnvironmentObject var userStore: UserStore
    
    var body: some View {
        // Compute the user's events right here in the view
        let userEvents = eventStore.events(for: userStore.currentUser?.id)
        
        List {
            ForEach(userEvents) { event in
                VStack(alignment: .leading) {
                    Text(event.eventName).font(.title)
                    Text(event.eventInfo).font(.headline)
                    Text(event.eventLocation).font(.subheadline)
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                }
            }
            .onDelete { indexSet in
                // Pass the specific userEvents array to the delete function
                deleteItems(at: indexSet, from: userEvents)
            }
        }
        .navigationTitle("My Events")
        .toolbar {
            EditButton()
        }
    }
    
    private func deleteItems(at offsets: IndexSet, from userEvents: [Event]) {
        for index in offsets {
            // Find the ID of the event we are deleting
            let eventToDelete = userEvents[index]
            // Tell the store to delete it from the main array
            eventStore.deleteEvent(withId: eventToDelete.id)
        }
    }
}
