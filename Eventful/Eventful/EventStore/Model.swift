//
//  Model.swift
//  Eventful
//
//  Created by Chris Wahlberg on 04/03/2026.
//

import Foundation


struct Event: Identifiable, Codable {
    let id: UUID
    let eventName: String
    let eventInfo: String
    let eventLocation: String
    let date: Date
    let ownerId: UUID // link to user who created it
    
    
    init(id: UUID = UUID(), eventName: String, eventInfo: String,
         eventLocation: String, date: Date, ownerId: UUID) {
        self.id = id
        self.eventName = eventName
        self.eventInfo = eventInfo
        self.eventLocation = eventLocation
        self.date = date
        self.ownerId = ownerId
    }
    
}
