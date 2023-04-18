//
//  EventTableViewCell.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var petNameLAbel: UILabel!
    @IBOutlet weak var eventDateLabel: UILabel!
    
    
    func configure(with event: Event){
        eventNameLabel.text = event.eventName
        petNameLAbel.text = event.pet?.name
        eventDateLabel.text = "\(event.eventDate)"
    }
}
