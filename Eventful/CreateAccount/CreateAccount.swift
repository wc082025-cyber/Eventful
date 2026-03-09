//
//  CreateAccount.swift
//  Eventful
//
//  Created by Chris Wahlberg on 09/03/2026.
//

import SwiftUI

struct CreateAccount: View {
    
    @State private var email: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var passwordConfirmation: String = ""
    
    var body: some View {
        
        ZStack{
            HStack{
                VStack{
                    
                    Text("CreateAccount")
                        .padding(20)
                    
                    TextField("Email", text: $email)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    TextField("First Name", text: $firstName)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    TextField("Last Name", text: $lastName)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                        
                    
                    TextField("Username", text: $username)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                    
                    SecureField("Repeat Password", text: $passwordConfirmation)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                    
                    
                    
                    Button (action: createAccount) {
                        Text("Create Account")
                           
                   
                            
                    }
                    //.padding(20)
                    .buttonStyle(.glassProminent)
                    .disabled(email .isEmpty || firstName .isEmpty || lastName .isEmpty || username .isEmpty || password .isEmpty || passwordConfirmation .isEmpty)
                    
                    
                } //VSTAck
                
            }//HStack
            
        }// ZStack
        
       
    }
    private func createAccount() {
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
}
#Preview {
    CreateAccount()
}
