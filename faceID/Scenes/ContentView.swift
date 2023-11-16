//
//  ContentView.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some View {
        NavigationView {
            VStack {
                if authenticationManager.isAuthenticated {
                    VStack {
                        Text("Welcome you are connected !")
                            .foregroundStyle(.white)
                        PrimaryBtn(text: "Logout")
                            .onTapGesture {
                                authenticationManager.logout()
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
                } else {
                    LoginView()
                        .environmentObject(authenticationManager)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
            .alert(isPresented: $authenticationManager.showAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text("Votre identifiant ou votre mot de passe sont incorrects."),
                    dismissButton: .default(Text("OK"))
                )
        }
        }
    }
}

#Preview {
    ContentView()
}
