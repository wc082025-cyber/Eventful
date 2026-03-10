//
//  Settings.swift
//  Eventful
//
//  Created by Chris Wahlberg on 06/03/2026.
//
import Foundation
import SwiftUI


struct Settings: View {
    @EnvironmentObject var userStore: UserStore
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showLoginError: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                // CHECK LOGIN STATE HERE
                if let currentUser = userStore.currentUser {
                    Text("Welcome, \(currentUser.firstName)!")
                        .font(.largeTitle)
                        .padding()
                    
                    Text("Logged in as: \(currentUser.username)")
                        .padding(.bottom, 20)
                    
                    Button("Log Out") {
                        userStore.logout()
                    }
                    .buttonStyle(.glassProminent)
                    
                } else {
                    // USER IS NOT LOGGED IN -> SHOW LOGIN FORM
                    TextField("Username", text: $username)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                    
                    SecureField("Password", text: $password)
                        .frame(width: 350)
                        .textFieldStyle(.roundedBorder)
                    
                    if showLoginError {
                        Text("Invalid username or password")
                            .foregroundColor(.red)
                    }
                    
                    Button(action: performLogin) {
                        Text("Login")
                    }
                    .buttonStyle(.glassProminent)
                    .disabled(username.isEmpty || password.isEmpty)
                    
                    NavigationStack {
                        NavigationLink("Create Account", destination: CreateAccount())
                            .buttonStyle(.glassProminent)
                    }
                }
            }
        }
    }
    
    private func performLogin() {
        let success = userStore.login(username: username, password: password)
        if success {
            showLoginError = false
            username = ""
            password = ""
        } else {
            showLoginError = true
        }
    }
}
#Preview{
    Settings()
}
