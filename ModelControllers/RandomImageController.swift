//
//  RandomImageController.swift
//  PetPal
//
//  Created by Taylor Terry on 4/19/23.
//

import Foundation

class RandomImageController {
    static let shared = RandomImageController()
    
    func fetchImage () {
        
        let headers = [
            "X-RapidAPI-Key": "4429f5eda7mshb9002a544cb9398p1430f3jsn7da0783b2d9a",
            "X-RapidAPI-Host": "dog-api.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://dog-api.p.rapidapi.com/image/random")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }
}
