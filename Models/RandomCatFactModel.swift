//
//  RandomCatFactModel.swift
//  PetPal
//
//  Created by Taylor Terry on 4/22/23.
//

import Foundation

struct Fact: Decodable {
    let text: String
    let length: Double
    
    
    enum CodingKeys: String, CodingKey {
        case text = "fact"
        case length = "length"
        
    }
}
  
