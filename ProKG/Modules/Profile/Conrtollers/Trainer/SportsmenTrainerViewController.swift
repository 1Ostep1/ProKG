//
//  SportsmenTrainerViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 22/6/21.
//

import UIKit
import XLPagerTabStrip

class SportsmenTrainerViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets 
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addSportsmanBtn: UIButton!
  
  //MARK: - Properties
  
  private lazy var arr = [
    ResultModel(name: "Aibek Айбеков Азаматович", weight: "68 кг", age: "12 лет", city: "Bishkek", federation: "Judo", place: "#1", image: "child"),
    ResultModel(name: "Aibek Айбеков Азаматович", weight: "68 кг", age: "12 лет", city: "Bishkek", federation: "Judo", place: "#1", image: "child"),
    ResultModel(name: "Aibek Айбеков Азаматович", weight: "68 кг", age: "12 лет", city: "Bishkek", federation: "Judo", place: "#1", image: "child"),
    ResultModel(name: "Aibek Айбеков Азаматович", weight: "68 кг", age: "12 лет", city: "Bishkek", federation: "Judo", place: "#1", image: "child"),
    ResultModel(name: "Aibek Айбеков Азаматович", weight: "68 кг", age: "12 лет", city: "Bishkek", federation: "Judo", place: "#1", image: "child")
  ] 
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTable()
  }
  
  //MARK: - Actions  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Спортсмены")
  }
  private func configureTable() {
    tableView.contentSize =  CGSize(width: tableView.frame.width, height: tableView.frame.height + 500)
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UINib(nibName: SportsmenTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: SportsmenTableViewCell.identifier)
  }
  @IBAction func addTapped(_ sender: UIButton) {
    let controller = SportsmanAddViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
extension SportsmenTrainerViewController: UITableViewDataSource {
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
    return 116
  }
}

extension SportsmenTrainerViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
//    let model = arr[indexPath.row]
    let controller = SportsmanInfoViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
