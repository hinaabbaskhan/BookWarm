//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Hina Khan on 21/07/2024.
//

import SwiftUI
import SwiftData

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Book.self)


    }
}

