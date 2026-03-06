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
    
}
