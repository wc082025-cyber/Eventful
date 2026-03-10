//
//  UserStore.swift
//  Eventful
//
//  Created by Chris Wahlberg on 10/03/2026.
//


import Foundation
import Combine

final class UserStore: ObservableObject {
    
    @Published var currentUser: User?
    @Published var users: [User] = []
    
    private let usersKey = "users"
    private let currentUserKey = "currentUser"
    
    init() {
        loadUsers()
        loadCurrentUser()
    }
    
    private func saveUsers() {
        if let data = try? JSONEncoder().encode(users) {
            UserDefaults.standard.set(data, forKey: usersKey)
        }
    }
    
    private func saveCurrentUser() {
        if let data = try? JSONEncoder().encode(currentUser) {
            UserDefaults.standard.set(data, forKey: currentUserKey)
        }
    }
    
    private func loadUsers() {
        guard let data = UserDefaults.standard.data(forKey: usersKey),
              let decoded = try? JSONDecoder().decode(User.self, from: data) else {
            return
        }
        self.currentUser = decoded
    }
    
    private func loadCurrentUser() {
        guard let data = UserDefaults.standard.data(forKey: currentUserKey),
              let decoded = try? JSONDecoder().decode(User.self, from: data) else {
            return
        }
        self.currentUser = decoded
    }
    
    func registerUser(username: String, email: String, firstName: String,
                      lastName: String, password: String) -> Bool {
        //check if username exist
        if users.contains(where: {$0.username == username}) {
            return false
        }
        let newUser = User(username: username, email: email, firstName: firstName,
                           lastName: lastName, password: password)
        users.append(newUser)
        saveUsers()
        return true
    }
    
    func login(username: String, password: String) -> Bool {
        guard let user = users.first(where: {$0.username == username}),
              user.verifyPassword(password) else {
            return false
        }
        currentUser = user
        saveCurrentUser()
        return true
    }
    
    func logout() {
        currentUser = nil
        saveCurrentUser()
    }
    
    func deleteUser (_ user: User) {
        users.removeAll { $0.id == user.id}
        if currentUser?.id == user.id {
            currentUser = nil
        }
        saveUsers()
        saveCurrentUser()
    }
    
}
