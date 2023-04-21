//
//  EventTableViewCell.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    private var event: Event?

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var petNameLAbel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    
    func configure(with event: Event){
        self.event = event
        eventNameLabel.text = event.eventName
        petNameLAbel.text = event.pet?.name
        eventDateLabel.text = DateFormatter.eventTime.string(from: event.eventDate ?? Date())
        
    }
}


