//
//  LoginView.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager

    var body: some View {
        VStack(spacing: 40) {
            Title()
            
            switch authenticationManager.biometryType {
                case .touchID:
                    PrimaryBtn(image: "touchid", text: "Login with TouchID")
                        .onTapGesture {
                            Task.init {
                                await authenticationManager.authenticateWithBiometrics()
                            }
                        }
                case .faceID:
                    PrimaryBtn(image: "faceid", text: "Login with FaceID")
                        .onTapGesture {
                            Task.init {
                                await authenticationManager.authenticateWithBiometrics()
                            }
                        }
                default:
                    NavigationLink {
                        CredentialsLoginView()
                            .environmentObject(authenticationManager)
                    } label: {
                        PrimaryBtn(image: "person.fill", text: "Login with credentials")
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationManager())
}
