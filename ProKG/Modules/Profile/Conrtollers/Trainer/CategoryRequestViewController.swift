//
//  CategoryRequestViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 23/6/21.
//

import UIKit

class CategoryRequestViewController: UIViewController {

  //MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var titleLabel: UILabel!
  
  //MARK: - Properties
  //MARK: - Life Cycle
  override func viewDidLoad() {
    configureTableView()
  }
  //MARK: - Actions
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    
  }
}
//MARK: - Table Extension
extension CategoryRequestViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "categoryRequest", for: indexPath)
    cell.textLabel?.text = "Older"
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let controller = SportsmenRequestViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
//    controller.titl = "Older"
    navigationController?.pushViewController(controller, animated: true)
  }
}
