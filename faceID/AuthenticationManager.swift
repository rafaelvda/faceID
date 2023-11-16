//
//  AuthenticationManager.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import Foundation
import LocalAuthentication

class AuthenticationManager: ObservableObject {
    
    private(set) var context = LAContext()
    private(set) var canEvaluatePolicy = false
    
    @Published private(set) var biometryType: LABiometryType = .none
    @Published private(set) var isAuthenticated = false
    @Published private(set) var errorDescription: String?
    @Published var showAlert = false
    
    init() {
        getBiometryType()
    }
 
    func getBiometryType() {
        canEvaluatePolicy = context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil)
        biometryType = context.biometryType
    }
    
    func authenticateWithBiometrics() async {
        context = LAContext()
        
        if canEvaluatePolicy {
            let resaon = "Log into your account"
            do {
                let success = try await context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: resaon)
                
                if success {
                    DispatchQueue.main.async {
                        self.isAuthenticated = true
                        print("isAuthenticated", self.isAuthenticated)
                    }
                }
            } catch {
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.errorDescription = error.localizedDescription
                    self.showAlert = true
                    self.biometryType = .none
                }
            }
            
            
        }
    }
    
    func auhtenticateWithCredentails(username: String, password: String) {
        if username.lowercased() == "rafael" && password == "1234" {
            isAuthenticated = true
        } else {
            errorDescription = "Mauvais mot de passe"
            showAlert = true
        }
    }
    
    func logout() {
        isAuthenticated = false
    }
}
