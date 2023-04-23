//
//  RandomCatFactModel.swift
//  PetPal
//
//  Created by Taylor Terry on 4/22/23.
//

import Foundation

struct Fact: Decodable {
    let id: String
    let text: String
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case text = "text"
    }
}
  
