//
//  DetailFilterTableViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class DetailFilterTableViewController: UITableViewController {
  
  //MARK: - Properties
  
  private var arr = ["Бокс", "Бадминтон", "Волейбол", "Гандбол"]
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton()
  }
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.font = UIFont(name: "Oswald-Medium", size: 18)
    cell.textLabel?.textColor = .white
    cell.textLabel?.text = arr[indexPath.row]
    return cell
  }
  
}
