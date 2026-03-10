//
//  User.swift
//  Eventful
//
//  Created by Chris Wahlberg on 10/03/2026.
//

import Foundation
import CryptoKit

struct User: Identifiable, Codable {
    
    let id: UUID
    let username: String
    let email: String
    let firstName: String
    let lastName: String
    let passwordHash: String // store hash never plain text
    let salt: String
    let createdAt: Date
    
    init(id: UUID = UUID(), username: String, email: String, firstName: String,
         lastName: String, password: String, salt: String = "") {
        self.id = id
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
      
        let saltData = salt.isEmpty ? Self.randomBytes(length: 32) : Data(base64Encoded: salt) ?? Self.randomBytes(length: 32)
        self.salt = saltData.base64EncodedString()
        
        let hash = Self.hashPassword(password, salt: saltData)
        self.passwordHash = hash.base64EncodedString()
        self.createdAt = Date()
    }
    
    private static func randomBytes(length: Int) -> Data {
        var bytes = [UInt8](repeating: 0, count: length)
        _ = SecRandomCopyBytes(kSecRandomDefault, length, &bytes)
        return Data(bytes)
    }
    
    private static func hashPassword(_ password: String, salt: Data) -> Data {
        let passwordData = Data(password.utf8)
        let combined = passwordData + salt
        
        let hashed = SHA256.hash(data: combined)
        return Data(hashed)
    }
    
    func verifyPassword(_ password: String) -> Bool {
        let saltData = Data(base64Encoded: self.salt) ?? Data()
        let computedHash = Self.hashPassword(password, salt: saltData)
        let storedHash = Data(base64Encoded: self.passwordHash) ?? Data()
        
        return computedHash == storedHash
    }
    
}
