//
//  Event+convenience.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import CoreData

extension Event {
    convenience init(frequency: String, eventName: String, eventDate: Date, pet: Pet, context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.frequency = frequency
        self.eventName = eventName
        self.eventDate = eventDate
        self.pet = pet
    }
}
