//
//  LoadingView.swift
//  Moviegram
//
//  Created by Christyan Duarte on 24/07/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
            Text("Loading...")
                .font(.headline)
                .padding(.top, 8)
        }
    }
}

#Preview {
    LoadingView()
}
