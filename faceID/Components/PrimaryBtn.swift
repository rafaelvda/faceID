//
//  PrimaryBtn.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import SwiftUI

struct PrimaryBtn: View {
    var image: String?
    var showImage = true
    var text: String
    
    var body: some View {
        HStack {
            if showImage {
                Image(systemName: image ?? "person.fill")
                    .foregroundStyle(.blue)
            }
            Text(text)
        }
        .padding() 
        .padding(.horizontal)
        .background(.white)
        .clipShape(.rect(cornerRadius: 30))
        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
        
    }
}

#Preview {
    PrimaryBtn(image: "faceid", text: "Login with FaceID")
}
