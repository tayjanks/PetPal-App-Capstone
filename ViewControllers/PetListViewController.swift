//
//  PetListViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/9/23.
//

import UIKit

class PetListViewController: UIViewController {

    @IBOutlet weak var petListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        PetController.shared.fetchPet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        petListTableView.reloadData()
    }
    
    
    @IBAction func addPetButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPetDetails",
           let indexPath = petListTableView.indexPathForSelectedRow,
           let destination = segue.destination as? PetDetailsViewController{
            let pet = PetController.shared.pets[indexPath.row]
            destination.pet = pet
                
            }
            
        }
    }

extension PetListViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PetController.shared.pets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "petCell", for: indexPath) as? PetTableViewCell
        else { return UITableViewCell() }
        let pet = PetController.shared.pets[indexPath.row]
        
        cell.configure(with: pet)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let pet = PetController.shared.pets[indexPath.row]
            PetController.shared.deletePet(pet)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
  
    
}
    
    extension PetListViewController: UITableViewDelegate {
        
    }

