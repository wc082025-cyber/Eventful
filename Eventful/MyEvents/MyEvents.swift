//
//  MyEvents.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//

import SwiftUI


struct MyEvents: View {
    
    @ObservedObject var store = EventStore()
    
    var body: some View {
        
        List{
            ForEach(store.events) { event in
                VStack(alignment: .leading) {
                    
                    Text(event.eventName).font(.title)
                    
                    Text(event.eventInfo).font(.headline)
                    
                    Text(event.eventLocation).font(.subheadline)
                    
                    Text(event.date, style: .date)
                    Text(event.date, style: .time)
                    
                }
            
            }
            .onDelete(perform: deleteItems)
            
            .onMove(perform: moveItems)
            }
        .navigationTitle("My Events")
        
        .toolbar{
            EditButton()
        }
    }
    
    private func deleteItems(at offsets: IndexSet) {
        for index in offsets.reversed() {
            let events = store.events[index]
            store.delete(events)
            
        }
    }
    
    
    private func moveItems(from source: IndexSet, to destination: Int) {
        guard let first = source.first else { return }
        store.move(from: first, to: destination)
    }
    
        
}
#Preview {
    MyEvents()
}
