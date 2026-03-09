//
//  Settings.swift
//  Eventful
//
//  Created by Chris Wahlberg on 06/03/2026.
//

import SwiftUI
import Foundation

struct SettingsStore: Identifiable, Codable {
    
    let id: UUID = UUID()
    let logIn: String
    let password: String
    
    
}





struct Settings: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack{
            
            HStack{
                
                VStack{
                    TextField("Username", text: $username)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    
                    SecureField("Password", text: $password)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        
                    
                    Button (action: saveSettings) {
                        Text("Login")
                           
                   
                            
                    }
                    //.padding(20)
                    .buttonStyle(.glassProminent)
                    .disabled(username .isEmpty || password .isEmpty)
                    
                    NavigationStack{
                        
                        
                        NavigationLink("Create Account", destination: CreateAccount())
                            .buttonStyle(.glassProminent)
                        
                    }
                } // VStack
                
            } // HStack
        } // ZStack
    }
    
    private func saveSettings() {
        let store = SettingsStore(logIn: username, password: password)
        do {
            let data = try JSONEncoder().encode(store)
            if let json = String(data: data, encoding: .utf8) {
                print("saved settingsStore: \(json)")
            }
        } catch {
            print("Failed to encode settings: \(error)")
        }
    }
    
   /* private func createAccount() {
        // TODO: Implement account creation flow
        NavigationLink(<#LocalizedStringKey#>, destination: CreateAccount())
        print("Create account tapped for username: \(username)")
    } */
}

#Preview {
    Settings()
}
