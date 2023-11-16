//
//  CredentialsLoginView.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import SwiftUI

struct CredentialsLoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
            
            SecureField("Password", text: $password)
            
            PrimaryBtn(showImage: false, text: "Login")
                .onTapGesture {
                    authenticationManager.auhtenticateWithCredentails(username: username, password: password)
                }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    CredentialsLoginView()
}
