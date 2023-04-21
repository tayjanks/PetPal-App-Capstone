//
//  EventDetailsViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import UIKit

class EventDetailsViewController: UIViewController {
   var pickerData = PetController.shared.pets
    var selectedPet: Pet?
    var selectedFrequency: String?
    
    @IBOutlet weak var eventNameTextField: UITextField!
    
    @IBOutlet weak var petAssignedToEventPickerView: UIPickerView!
    
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var frequencyPickerView: UIPickerView!
    var picker1Options:[String] = []
    var event: Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PetController.shared.fetchPet()
        frequencyPickerView.dataSource = self
        frequencyPickerView.delegate = self
        
        picker1Options = ["Daily", "Weekly", "Monthly", "Yearly", "None"]
        petAssignedToEventPickerView.dataSource = self
        petAssignedToEventPickerView.delegate = self
        
        if let event = event {
            title = "Update Event"
            eventNameTextField.text = event.eventName
            eventDatePicker.date = event.eventDate ?? Date()
            selectedPet = event.pet
            selectedFrequency = event.frequency
            
            
            
        } else {
            title = "Add Event"
        }
        
    }
    

    
    
    @IBAction func saveEventButtonTapped(_ sender: UIBarButtonItem) {
        guard let eventName = eventNameTextField.text,
              let frequency = selectedFrequency,
                let pet = selectedPet,
                !eventName.isEmpty
        else { return }
        let eventDate = eventDatePicker.date
        if let event = event {
            EventController.shared.updateEvent (event: event, eventName: eventName, frequency: frequency, eventDate: eventDate, pet: pet)
            
        } else {
            EventController.shared.createEvent(eventName: eventName, frequency: frequency, eventDate: eventDate, pet: pet)
        
        
    
    }
        navigationController?.popViewController(animated: true)
    }
    

}

// MARK: Custom Picker View

extension EventDetailsViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 2 {return PetController.shared.pets.count}
        else {
            return picker1Options.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 2 {
            
            let indexPath = NSIndexPath(row: row, section: 0)
            let pet = PetController.shared.pets[indexPath.row]
            var petName: AnyObject? = pet.value(forKey: "name") as AnyObject
            if  selectedPet != nil && selectedPet == pet {
                pickerView.selectRow(row, inComponent: 0, animated: true)
            }
            return petName as? String
        } else {
            if selectedFrequency != nil && selectedFrequency == picker1Options[row] {
                pickerView.selectRow(row, inComponent: 0, animated: true)
            }
            
            return "\(picker1Options[row])"
            
            
        }
        
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 2 {
            let pet = PetController.shared.pets[row]
            self.selectedPet = pet
        } else if pickerView.tag == 1 {
            let frequency = picker1Options[row]
            self.selectedFrequency = frequency
            
        }
    }
    
}
    






