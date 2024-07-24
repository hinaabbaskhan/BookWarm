//
//  Student.swift
//  Bookworm
//
//  Created by Hina Khan on 24/07/2024.
//


@Observable
class Student {
    var id: UUID
    var name: String

    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
