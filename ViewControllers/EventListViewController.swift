//
//  EventListViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/15/23.
//

import UIKit

class EventListViewController: UIViewController {

    @IBOutlet weak var eventListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        EventController.shared.fetchEvent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        /*eventListTableView.reloadData()*/
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetails",
           let indexPath = eventListTableView.indexPathForSelectedRow,
           let destination = segue.destination as? EventDetailsViewController{
            let event = EventController.shared.events[indexPath.row]
            destination.event = event
                
            }
            
        }
    }

extension EventListViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventController.shared.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventTableViewCell
        else { return UITableViewCell() }
        let event = EventController.shared.events[indexPath.row]
        
        cell.configure(with: event)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            let event = EventController.shared.events[indexPath.row]
            EventController.shared.deleteEvent(event)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
  
    
}
    
    extension EventListViewController: UITableViewDelegate {
        
    }

