//
//  PetImageViewController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/23/23.
//

import UIKit

protocol PetImageViewControllerDelegate: class {
    func imgButtonTapped(with emoji: String)
}

class PetImageViewController: UIViewController {
    
    weak var delegate: PetImageViewControllerDelegate?

    @IBAction func emojiTapped(_ sender: UIButton) {
        guard let emoji = sender.titleLabel?.text
        else { return }
        
        delegate?.imgButtonTapped(with: emoji)
        dismiss(animated: true, completion: nil)
            
       
        }

}
