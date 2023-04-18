//
//  EventDetailsViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import UIKit

class EventDetailsViewController: UIViewController {
   var pickerData = PetController.shared.pets
    
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
            
            
            
        } else {
            title = "Add Event"
        }
        
    }
    

    
    
    /*@IBAction func saveEventButtonTapped(_ sender: UIBarButtonItem) {
        guard let eventName = eventNameTextField.text,
              let eventDate = eventDatePicker.date,
              let frequency = frequencyPickerView.row
                let pet = petAssignedToEventPickerView
                !eventName.isEmpty
        else { return }
        
        if let event = event {
            EventController.shared.updateEvent ()
            
        } else {
            EventController.shared.create()
        
        
        navigationController?.popViewController(animated: true)
    }
    
    } */
    

}



extension EventDetailsViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 2 {return PetController.shared.pets.count}
        else {
            return picker1Options.count
        }
    }
    
    
    
}


extension EventDetailsViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 2 {
            
            let indexPath = NSIndexPath(row: row, section: 0)
            let pet = PetController.shared.pets[indexPath.row]
            var petName: AnyObject? = pet.value(forKey: "name") as AnyObject
            return petName as! String}
        else { return "\(picker1Options[row])"}
            
        }
                
       
        }
    






