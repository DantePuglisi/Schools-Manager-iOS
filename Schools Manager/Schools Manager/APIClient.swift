//
//  APIClient.swift
//  Schools Manager
//
//  Created by Dante Puglisi on 12/29/17.
//  Copyright © 2017 Dante Puglisi. All rights reserved.
//

import Alamofire

class APIClient {
  static func register(withUsername username: String, password: String) {
    print("Sending request")
    let parameters: Parameters = ["username": username, "password": password]
    Alamofire.request("http://127.0.0.1:5000/register", method: .post, parameters: parameters).responseJSON { response in
      if let json = response.result.value {
        print("JSON: \(json)")
      }
    }
  }
  
  static func login(withUsername username: String, password: String, completion: @escaping () -> Void) {
    print("Sending request")
    let parameters: Parameters = ["username": username, "password": password]
    Alamofire.request("http://127.0.0.1:5000/auth", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
      if let json = response.result.value as? [String: AnyObject] {
        print("JSON: \(json)")
        if let access_token = json["access_token"] {
          print("Access token is: \(access_token)")
          UserDefaults.standard.set(access_token, forKey: "access_token")
        }
      }
      completion()
    }
  }
}
