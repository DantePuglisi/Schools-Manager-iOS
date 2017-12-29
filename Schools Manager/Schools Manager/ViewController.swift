//
//  ViewController.swift
//  Schools Manager
//
//  Created by Dante Puglisi on 12/29/17.
//  Copyright © 2017 Dante Puglisi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var usernameTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func registerButtonPressed(_ sender: Any) {
    guard let username = usernameTextField.text, let password = passwordTextField.text, username.count > 0, password.count > 0 else {
      return
    }
    APIClient.register(withUsername: usernameTextField.text!, password: passwordTextField.text!)
  }
  
  @IBAction func loginButtonPressed(_ sender: Any) {
    guard let username = usernameTextField.text, let password = passwordTextField.text, username.count > 0, password.count > 0 else {
      return
    }
    APIClient.login(withUsername: usernameTextField.text!, password: passwordTextField.text!, completion: {
      if UserDefaults.standard.string(forKey: "access_token") != nil {
        let storyboard = UIStoryboard(name: "SchoolsListViewController", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SchoolsListViewController") as! SchoolsListViewController
        self.present(controller, animated: true, completion: nil)
      }
    })
  }
  
}

