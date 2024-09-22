//
//  ContentView.swift
//  Bookworm
//
//  Created by Hina Khan on 21/07/2024.
//

import SwiftUI
import SwiftData

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool


    var onColors = [Color.red, Color.yellow]
    var offColors = [Color(white: 0.6), Color(white: 0.4)]

    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(LinearGradient(colors: isOn ? onColors : offColors, startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(radius: isOn ? 0 : 5)
    }
}

//struct ContentView: View {
//    @State private var rememberMe = false
//
//    var body: some View {
//        VStack {
//                    PushButton(title: "Remember Me", isOn: $rememberMe)
//                    Text(rememberMe ? "On" : "Off")
//                }
//    }
//}

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(sort: [SortDescriptor(\Book.title, order: .reverse)]) var books: [Book]
    @State private var showingAddScreen = false

    var body: some View {
//        NavigationStack {
//            TextField("Enter your text", text: $notes, axis: .vertical)
//                .textFieldStyle(.roundedBorder)
//                .navigationTitle("Notes")
//                .padding()
//        }
        NavigationStack {
            
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
                .navigationTitle("Bookworm")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button("Add Book", systemImage: "plus") {
                            showingAddScreen.toggle()
                        }
                    }
                }
                .sheet(isPresented: $showingAddScreen) {
                    AddBookView()
                }
        }

    }
}

#Preview {
    ContentView()
}
