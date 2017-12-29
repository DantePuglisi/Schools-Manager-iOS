//
//  SchoolsListViewController.swift
//  Schools Manager
//
//  Created by Dante Puglisi on 12/29/17.
//  Copyright © 2017 Dante Puglisi. All rights reserved.
//

import UIKit

class SchoolsListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  @IBOutlet weak var tableView: UITableView!
  
  var schools = [String]()
  var students = [(name: String, schoolName: String)]()
  var diagramArray = [[String: AnyObject]]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    APIClient.getStudents { [weak self] (students) in
      self?.students = students
      self?.addSchools()
      self?.createDiagramArray()
      self?.tableView.reloadData()
    }
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return schools.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let students = diagramArray[section]["students"] as? [(name: String, schoolName: String)] {
      return students.count
    }
    return 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
    
    if let students = diagramArray[indexPath.section]["students"] as? [(name: String, schoolName: String)] {
      cell.textLabel?.text = students[indexPath.row].name
    }
    
    cell.selectionStyle = .none
    return cell
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return schools[section]
  }
  
  func addSchools() {
    for student in students {
      if !schools.contains(student.schoolName) {
        schools.append(student.schoolName)
      }
    }
  }
  
  func createDiagramArray() {
    for school in schools {
      var schoolStudents = [(name: String, schoolName: String)]()
      for student in students {
        if student.schoolName == school {
          schoolStudents.append(student)
        }
      }
      diagramArray.append(["school": school as AnyObject, "students": schoolStudents as AnyObject])
    }
  }
}
