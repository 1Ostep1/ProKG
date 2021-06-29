//
//  CategoryJudgeViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class CategoryJudgeViewController: UIViewController {
  
  //MARK: - Outlets
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - Properties
  private let arr = ["Взрослые 1976 - 2002", "Юниоры 2003-2005", "Кадеты 2006-2008", "Дети 2009-2010"]
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    setupBackButton(with: "Назад")

  }
  
  //MARK: - Actions
}
extension CategoryJudgeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
    cell.textLabel?.font = UIFont(name: "Oswald-Medium", size: 18)
    cell.textLabel?.textColor = .white
    cell.textLabel?.text = arr[indexPath.row]
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let controller = StartJudgeViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
