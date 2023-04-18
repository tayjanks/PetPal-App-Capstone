//
//  CoreDataStack.swift
//  PetPal
//
//  Created by Taylor Terry on 4/9/23.
//

import CoreData

enum CoreDataStack {
    static let container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "PetPal")
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Error loading persistent data \(error)")
            }
        }
        return container
    } ()
    
    static var context: NSManagedObjectContext { container.viewContext }
    
    static func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                NSLog("Error saving context \(error)")
            }
        }
    }
    
}
