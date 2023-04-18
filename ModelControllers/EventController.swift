//
//  EventController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import CoreData

class EventController {
    
    static let shared = EventController()
    
    private init() {}
    var events: [Event] = []
    
    private lazy var fetchRequest: NSFetchRequest<Event> = {
        let request = NSFetchRequest<Event>(entityName: "Event")
        request.predicate = NSPredicate(value:true)
        return request
    }()
    
    func createEvent (eventName:String, frequency:String, eventDate: Date, pet: Pet) {
        let event = Event(frequency: frequency, eventName: eventName, eventDate: eventDate, pet: pet)
        events.append(event)
        CoreDataStack.saveContext()
    }
    func fetchEvent() {
        let events = (try? CoreDataStack.context.fetch(self.fetchRequest)) ?? []
        print(events.count)
        self.events = events
    }
    
    func updateEvent(event: Event, eventName:String, frequency:String, eventDate: Date, pet: Pet) {
        event.eventName = eventName
        event.frequency = frequency
        event.eventDate = eventDate
        event.pet = pet
        CoreDataStack.saveContext()
    }
    
    func deleteEvent(_ event: Event) {
       if let index = events.firstIndex(of: event){
            events.remove(at: index)
        }
    
        CoreDataStack.context.delete(event)
        CoreDataStack.saveContext()
        
    }
    
}

