//
//  ResultsViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit
import XLPagerTabStrip

class ResultsViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets
  
  @IBOutlet weak var resultTableView: UITableView!
  
  //MARK: - Properties
  private var arr = [
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
    ResultModel(name: "Aкматов Азамат Акматович", weight: "60 кг", age: "30 лет", city: "Бишкек, Федерация Таэквандо", federation: "", place: "№1", image: "child"),
  ]
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    // Do any additional setup after loading the view.
  }
  
  //MARK: - Actions
  
  private func configureTableView() {
    resultTableView.delegate = self
    resultTableView.dataSource = self
    resultTableView.register(UINib(nibName: SportsmenTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: SportsmenTableViewCell.identifier)
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Результаты")
  }
}
extension ResultsViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SportsmenTableViewCell.identifier, for: indexPath) as! SportsmenTableViewCell
    let model = arr[indexPath.row]
    cell.configureCell(model: model)
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 106
  }
}
