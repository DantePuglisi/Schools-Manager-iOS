//
//  SchoolsListViewController.swift
//  Schools Manager
//
//  Created by Dante Puglisi on 12/29/17.
//  Copyright © 2017 Dante Puglisi. All rights reserved.
//

import UIKit

class SchoolsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
    
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "Test"
  }
  
}
