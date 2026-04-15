//
//  Pet.swift
//  Paws
//
//  Created by Jorge Azurduy on 2/2/26.
//

import Foundation
import SwiftData

@Model
class Pet: Identifiable {
    let id: UUID
    var name: String
    
    @Attribute(.externalStorage)
    var photo: Data?
    
    init(name: String, photo: Data? = nil) {
        self.id = UUID()
        self.name = name
        self.photo = photo
    }
}

extension Pet {
    @MainActor
    static var preview: ModelContainer {
        let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try! ModelContainer(for: Pet.self, configurations: configuration)
        
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        container.mainContext.insert(Pet(name: "Chilli"))
        container.mainContext.insert(Pet(name: "RExy"))
        container.mainContext.insert(Pet(name: "Dona"))
        container.mainContext.insert(Pet(name: "Achichi"))
        container.mainContext.insert(Pet(name: "Antony"))
        container.mainContext.insert(Pet(name: "Plopy"))
        container.mainContext.insert(Pet(name: "Talo"))
        return container
    }
}
