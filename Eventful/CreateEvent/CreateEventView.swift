//
//  CreateEventView.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//


import SwiftUI




struct CreateEventView: View {
    
    @StateObject private var store = EventStore()
    
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
                                    let newEvent = Event(id: UUID(), eventName: eventName, eventInfo: eventInfo, eventLocation: eventLocation,  date: date)
                                    store.events.append(newEvent)
                                }
                                
                              
                                
                                .buttonStyle(.glassProminent)
                               // .disabled(eventName.isEmpty)
                                Spacer()
                                
                            Button("Save") {
                                let newEvent = Event(id: UUID(), eventName: eventName, eventInfo: eventInfo, eventLocation: eventLocation,  date: date)
                                store.events.append(newEvent)
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
