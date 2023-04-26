//
//  RandomCatFactController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/22/23.
//


import UIKit

class RandomCatFactController {
    var data = Fact(text: "Want a fun animal fact?!", length: 0)
    static let shared = RandomCatFactController()
    
    func getFact(){

        let urlString = "https://catfact.ninja/fact"
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) {data, _, error in
            DispatchQueue.main.async {
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Fact.self, from: data)
                        self.data = decodedData
                    } catch {
                        print("Error with Cat Fact JSON Data")
                    }
                }
            }
        }.resume()
    }
}
