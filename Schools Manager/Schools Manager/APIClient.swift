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
  
  /*static func getSchools(completion: @escaping (_ schools: [(id: Int, name: String)]) -> Void) {
    Alamofire.request("http://127.0.0.1:5000/schools", method: .get).responseJSON { response in
      if let json = response.result.value as? [String: AnyObject] {
        var schoolsToReturn = [(id: Int, name: String)]()
        if let schools = json["schools"] as? [[String: AnyObject]] {
          for (index, school) in schools.enumerated() {
            schoolsToReturn.append((id: index + 1, name: school["name"] as! String))
          }
        }
        completion(schoolsToReturn)
      }
    }
  }*/
  
  static func getStudents(completion: @escaping (_ students: [(name: String, schoolName: String)]) -> Void) {
    Alamofire.request("http://127.0.0.1:5000/students", method: .get).responseJSON { response in
      if let json = response.result.value as? [String: AnyObject] {
        var studentsToReturn = [(name: String, schoolName: String)]()
        if let students = json["students"] as? [[String: AnyObject]] {
          for student in students {
            studentsToReturn.append((name: student["name"] as! String, schoolName: student["school"] as! String))
          }
        }
        completion(studentsToReturn)
      }
    }
  }
}
