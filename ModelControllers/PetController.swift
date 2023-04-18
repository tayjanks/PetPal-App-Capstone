//
//  PetController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/8/23.
//

import CoreData

class PetController {
    
    static let shared = PetController()
    
    private init() {}
    var pets: [Pet] = []
    
    private lazy var fetchRequest: NSFetchRequest<Pet> = {
        let request = NSFetchRequest<Pet>(entityName: "Pet")
        request.predicate = NSPredicate(value:true)
        return request
    }()
    
    func create(name:String, breed: String, diet: String, gender: String, notes: String,  species: String, vet: String) {
        let pet = Pet(name: name, breed: breed, diet: diet, gender: gender, notes: notes, species: species, vet: vet)
        pets.append(pet)
        CoreDataStack.saveContext()
    }
    func fetchPet() {
        let pets = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(pets.count)
        self.pets = pets
    }
    
    func updatePet(pet:Pet, name: String, breed: String, diet: String, gender: String, notes: String, species: String, vet: String) {
        pet.name = name
        pet.breed = breed
        pet.diet = diet
        pet.gender = gender
        pet.notes = notes
        pet.species = species
        pet.vet = vet
        CoreDataStack.saveContext()
    }
    
    func deletePet(_ pet: Pet) {
       if let index = pets.firstIndex(of: pet){
            pets.remove(at: index)
        } 
    
        CoreDataStack.context.delete(pet)
        CoreDataStack.saveContext()
        
    }
    
}
