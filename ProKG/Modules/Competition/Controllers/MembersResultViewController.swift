//
//  MembersResultViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 2/7/21.
//

import UIKit

class MembersResultViewController: UIViewController {
  
  //MARK: - Outlets
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - Properties
  private var arr = [
    ResultModel(name: "Aibekov Akmat Azamatovich", weight: "68", age: "13", city: "Bishkek", federation: "федерация Таэкондо КР", place: "1", image: "basketball"),
    ResultModel(name: "Aibekov Akmat Azamatovich", weight: "68", age: "13", city: "Bishkek", federation: "федерация Таэкондо КР", place: "1", image: "basketball"),
    ResultModel(name: "Aibekov Akmat Azamatovich", weight: "68", age: "13", city: "Bishkek", federation: "федерация Таэкондо КР", place: "1", image: "basketball"),
    ResultModel(name: "Aibekov Akmat Azamatovich", weight: "68", age: "13", city: "Bishkek", federation: "федерация Таэкондо КР", place: "1", image: "basketball")
  ]
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  
  //MARK: - Actions
  private func configureUI() {
    tableView.delegate = self
    tableView.dataSource = self
  }
}

extension MembersResultViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "NSPCell", for: indexPath)
      return cell
    }
    let cell = tableView.dequeueReusableCell(withIdentifier: MembersResultTableViewCell.identifier, for: indexPath) as! MembersResultTableViewCell
    let model = arr[indexPath.row]
    cell.configureCell(model: model)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0 {
      return 46
    }
    return 90
  }
}
