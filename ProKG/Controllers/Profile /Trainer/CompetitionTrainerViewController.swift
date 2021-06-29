//
//  CompetitionTrainerViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 22/6/21.
//

import UIKit
import XLPagerTabStrip

class CompetitionTrainerViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var segmentController: UISegmentedControl!
  
  //MARK: - Properties
  
  private lazy var arr = [
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball"),
    EventsModel(title: "Открытое первенство по Таэквандо", category: "ТАЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "12.04.42", endDate: "14.53.12", image: "basketball")
  ]
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTableView()
    // Do any additional setup after loading the view.
  }
  
  //MARK: - Actions
  private func configureTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: CompetionTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CompetionTableViewCell.identifier)
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Соревнования")
  }
  @IBAction func typeTapped(_ sender: UISegmentedControl) {
  }
}
extension CompetitionTrainerViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arr.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CompetionTableViewCell.identifier, for: indexPath) as! CompetionTableViewCell
    let model = arr[indexPath.row]
    cell.configure(cell: model)
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let controller = ResultsViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 175
  }
}
