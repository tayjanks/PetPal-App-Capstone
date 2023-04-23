//
//  RandomCatFactController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/22/23.
//


import UIKit

class RandomCatFactController {
    var data = Fact(id: "0", text: "Want a fun animal fact?!")
    static let shared = RandomCatFactController()
    
    func getFact(){

        let urlString = "https://cat-fact.herokuapp.com/facts/random"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Fact.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error with JSON Data")
                    }
                }
            }
        }.resume()
    }
}
