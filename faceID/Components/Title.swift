//
//  SwiftUIView.swift
//  faceID
//
//  Created by Rafael Videira on 16/11/2023.
//

import SwiftUI

struct Title: View {
    var body: some View {
        Text("Authentication")
            .bold()
            .font(.title)
            .foregroundStyle(.white)
    }
}

#Preview {
    Title()
        .background(LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing))
}
