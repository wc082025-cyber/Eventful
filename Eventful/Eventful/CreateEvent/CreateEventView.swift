//
//  CreateEventView.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//


import SwiftUI
import Combine
import Foundation



struct CreateEventView: View {
    
    @EnvironmentObject var userStore: UserStore
    @EnvironmentObject var eventStore: EventStore
    
    @State private var invite: String = ""
    
    @State private var eventName: String = ""
    @State private var eventInfo: String = ""
    @State private var eventLocation: String = ""
    @State private var date = Date()
    
   
   
        
       
       
    
    var body: some View {
        
        
        
        NavigationStack {
            
            ZStack {
       
                
                HStack {
                    
                    VStack {
                        
                        
                        Form {
                            Section(header: Text("Create Event")) {
                                
                                
                                DatePicker(
                                    "start date",
                                    selection: $date,
                                   
                                    displayedComponents: [.date, .hourAndMinute]
                                    
                                )
                                
                                .datePickerStyle(GraphicalDatePickerStyle())
                                
                                TextField("Event Name", text: $eventName)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                               
                                TextField("Event Info", text: $eventInfo)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                                TextField("Event Location", text: $eventLocation)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                  //  .padding()
                            }
                            HStack{
                                
                                Button("Invite") {
                                    guard let userId = userStore.currentUser?.id else { return }
                                    let newEvent = Event(
                                        id: UUID(),
                                        eventName: eventName,
                                        eventInfo: eventInfo,
                                        eventLocation: eventLocation,
                                        date: date,
                                        ownerId: userId
                                    )
                                    eventStore.addEvent(newEvent)
                                    // Maybe show a success message or clear fields
                                }
                              
                                
                                .buttonStyle(.glassProminent)
                               // .disabled(eventName.isEmpty)
                                Spacer()
                                
                                Button("Save") {
                                    // Check if user is logged in
                                    guard let userId = userStore.currentUser?.id else {
                                        // Optionally show an alert or navigate to login
                                        return
                                    }
                                    
                                    let newEvent = Event(
                                        id: UUID(),
                                        eventName: eventName,
                                        eventInfo: eventInfo,
                                        eventLocation: eventLocation,
                                        date: date,
                                        ownerId: userId
                                    )
                                    eventStore.addEvent(newEvent)
                                    
                                    // Clear form fields after saving
                                    eventName = ""
                                    eventInfo = ""
                                    eventLocation = ""
                                }
                                .buttonStyle(.glassProminent)
                                .disabled(eventName.isEmpty || eventInfo.isEmpty || eventLocation.isEmpty)
                               // Spacer()
                                Button("Share") {
                                    
                                }
                                .buttonStyle(.glassProminent)
                                .disabled(eventName.isEmpty || eventInfo.isEmpty || eventLocation.isEmpty)
                            }
                        }
                        .navigationTitle("New Event")
                        .formStyle(.columns)
                        
                    } // Vstack 1
                    
                    .padding()
                    
                } // HStack 1
                
            }// ZStack 1
            
        } // NavigationStack
        
    }
}

#Preview {
    CreateEventView()
}
