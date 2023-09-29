//
//  RegisterInteractor.swift
//  SpeedyDemoProject
//
//  Created by prem  on 29/09/23.
//

import UIKit

class RegisterInteractor: RegisterInteractorInputProtocol {
    
    func interactorRegisterRequest(input: RegisterInput) {
        // declare the parameter as a dictionary that contains string as key and value combination. considering inputs are valid
          
        let parameters: [String: Any] = ["full_name": input.full_name,"phone": input.phone,"email":input.email ]
        
        print(input)
        // create the url with URL
        let url = URL(string: "https://api.staging.speedyy.com/user/swagger/#/Customer/post_user_customer_auth_register_otp")! // change server url accordingly
        
        // create the session object
        let session = URLSession.shared
        
        // now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        // add headers for the request
        request.addValue("application/json", forHTTPHeaderField: "Content-Type") // change as per server requirements
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
          // convert parameters to Data and assign dictionary to httpBody of request
          request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch let error {
          print(error.localizedDescription)
          return
        }
        
        // create dataTask using the session object to send data to the server
        let task = session.dataTask(with: request) { data, response, error in
          
          if let error = error {
            print("Post Request Error: \(error.localizedDescription)")
            return
          }
          
          // ensure there is valid response code returned from this HTTP response
          guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode)
            
         
            else {
            print("Invalid Response received from the server")
            return
          }
          
          // ensure there is data returned
          guard let responseData = data else {
            print("nil Data received from the server")
            return
          }
          print(responseData)
          do {
            // create json object from data or use JSONDecoder to convert to Model stuct
            if let jsonResponse = try JSONSerialization.jsonObject(with: responseData, options: .mutableContainers) as? [String: Any] {
              print(jsonResponse)
              // handle json response
            } else {
              print("data maybe corrupted or in wrong format")
              throw URLError(.badServerResponse)
            }
          } catch let error {
            print(error.localizedDescription)
          }
        }
        // perform the task
        task.resume()
    }
    
    func interactorRegisterApi(input: RegisterInput) {
        print("")
    }


    weak var presenter: RegisterInteractorOutputProtocol?
}
