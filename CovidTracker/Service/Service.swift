//
//  Service.swift
//  CovidTracker
//
//  Created by Rachit Anurag on 2020/04/13.
//  Copyright © 2020 Rachit Anurag. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    
    func sendData(inputData: LocationHistoryForServer) {
        let urlString = "http://52.66.156.232:8000/report/"
        guard let url = URL(string: urlString) else { return }
        do {
            let enc = JSONEncoder()
            let data = try enc.encode(inputData)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) in
                guard error == nil else {
                    print("error calling POST on /corona_app")
                    print(error!)
                    return
                }
                guard let responseData = data else {
                    print("Error: did not receive data")
                    return
                }
                
                // parse the result as JSON, since that's what the API provides
                do {
                    guard let receivedData = try JSONSerialization.jsonObject(with: responseData, options: .allowFragments)  as? String else {
                        print("Error in reading the response from the data.")
                        return
                    }
                    print(receivedData)
                    print("The todo is: " + receivedData.description)
                } catch  {
                    print("error parsing response from POST on /todos")
                    return
                }
            }).resume()
           
        } catch let error {
            print("Error occured in parsing JSON input data. \(error)")
        }
    }
}
