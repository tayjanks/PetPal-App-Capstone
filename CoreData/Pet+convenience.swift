//
//  Pet+convenience.swift
//  PetPal
//
//  Created by Taylor Terry on 4/9/23.
//

import CoreData

extension Pet {
    convenience init(name: String, breed: String, diet: String, gender: String, notes: String, species: String, vet: String, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.id = UUID().uuidString
        self.name = name
        self.breed = breed
        self.diet = diet
        self.gender = gender
        self.notes = notes
        self.species = species
        self.vet = vet
    }
}
