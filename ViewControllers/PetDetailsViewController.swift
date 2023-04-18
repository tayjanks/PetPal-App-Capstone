//
//  PetDetailsViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/9/23.
//

import UIKit

class PetDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var petNameTextField: UITextField!
    
    @IBOutlet weak var speciesTextField: UITextField!
    
    @IBOutlet weak var breedTextField: UITextField!
    
    @IBOutlet weak var genderTextField: UITextField!
    
    @IBOutlet weak var dietTextField: UITextField!
    
    @IBOutlet weak var vetTextField: UITextField!
    @IBOutlet weak var notesTextField: UITextField!
    @IBOutlet weak var petPhotoImg: UIImageView!
    
    var pet: Pet?
    
    //might need to remove this later, not currently using titles
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pet = pet {
            title = pet.name
            petNameTextField.text = pet.name
            speciesTextField.text = pet.species
            breedTextField.text = pet.breed
            genderTextField.text = pet.gender
            dietTextField.text = pet.diet
            vetTextField.text = pet.vet
            notesTextField.text = pet.notes
        } else {
            title = "Add Pet"
        }
        

    }
    
    
    

    @IBAction func petDetailsSaveButtonTapped(_ sender: UIButton) {
        guard let name = petNameTextField.text,
              let breed = breedTextField.text,
              let diet = dietTextField.text,
              let gender = genderTextField.text,
              let notes = notesTextField.text,
              let species = speciesTextField.text,
              let vet = vetTextField.text,
              !name.isEmpty
        else { return }
        
        if let pet = pet {
            PetController.shared.updatePet(pet: pet, name: name, breed: breed, diet: diet, gender: gender, notes: notes, species: species, vet: vet)
            
        } else {
            PetController.shared.create(name: name, breed: breed, diet: diet, gender: gender, notes: notes, species: species, vet: vet)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
}
