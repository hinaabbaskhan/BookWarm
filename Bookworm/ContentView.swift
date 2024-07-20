//
//  ContentView.swift
//  Bookworm
//
//  Created by Hina Khan on 21/07/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var rememberMe = false

    var body: some View {
        Toggle("Remember Me", isOn: $rememberMe)
    }
}

#Preview {
    ContentView()
}
