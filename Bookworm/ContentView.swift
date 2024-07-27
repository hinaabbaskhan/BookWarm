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
    @AppStorage("notes") private var notes = ""
    @Query var students: [Student]
    @Environment(\.modelContext) var modelContext

    var body: some View {
        NavigationStack {
            List(students) { student in
                Text(student.name)
            }
            .navigationTitle("Classroom")
            .toolbar {
                Button("Add") {
                    let firstNames = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                    let lastNames = ["Granger", "Lovegood", "Potter", "Weasley"]

                    let chosenFirstName = firstNames.randomElement()!
                    let chosenLastName = lastNames.randomElement()!

                    let student = Student(id: UUID(), name: "\(chosenFirstName) \(chosenLastName)")
                    modelContext.insert(student)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
