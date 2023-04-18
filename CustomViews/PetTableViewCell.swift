//
//  PetTableViewCell.swift
//  PetPal
//
//  Created by Taylor Terry on 4/11/23.
//

import UIKit

class PetTableViewCell: UITableViewCell {

    @IBOutlet weak var petName: UILabel!
    
    @IBOutlet weak var petPhoto: UIImageView!
   
    func configure(with pet: Pet){
        petName.text = pet.name
    }

}
