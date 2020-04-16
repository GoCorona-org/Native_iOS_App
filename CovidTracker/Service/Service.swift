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
        let urlString = "http://127.0.0.1:8000/corona_app/"
        guard let url = URL(string: urlString) else { return }
        do {
            let enc = JSONEncoder()
            let data = try enc.encode(inputData)
            //let data = try JSONSerialization.data(withJSONObject: inputData, options: [])
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = data
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            
            let task = URLSession.shared.dataTask(with: request)
            task.resume()
            
            /*URLSession.shared.uploadTask(with: URLRequest(url: url), from: data, completionHandler: {(data, response, error) in
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
                    guard let receivedTodo = try JSONSerialization.jsonObject(with: responseData,
                                                                              options: []) as? [String: Any] else {
                                                                                print("Could not get JSON from responseData as dictionary")
                                                                                return
                    }
                    print(receivedTodo)
                    print("The todo is: " + receivedTodo.description)
                    
                    guard let todoID = receivedTodo["id"] as? Int else {
                        print("Could not get todoID as int from JSON")
                        return
                    }
                    print("The ID is: \(todoID)")
                } catch  {
                    print("error parsing response from POST on /todos")
                    return
                }
            }).resume()*/
        } catch let error {
            print("Error occured in parsing JSON input data. \(error)")
        }
        
        
        
    }
}
