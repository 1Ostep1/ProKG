//
//  ViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/14/21.
//

import UIKit

class CompetitionViewController: UIViewController {
  
  //MARK: - Outlets
  
  @IBOutlet var competitionTable: UITableView!
  
  //MARK: - Propeties
  
  private var arrayOfCompetition = [EventsModel]()  
  private let model1 = EventsModel(title: "Открытое первенство по Тхэквандо", category: "Тхэквондо", type: "Завершено", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  private let model = EventsModel(title: "Открытое первенство по Тхэквандо", category: "Тхэквондо", type: "Регистрация открыта", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad() 
    setupTransparentNavigationBar()
    setUpLogoToTitle()
    configureTable()
  }
  private func configureTable() {
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    competitionTable.register(UINib(nibName: K.CompetitionTableViewCell, bundle: nil), forCellReuseIdentifier: K.CompetitionTableViewCell)
    competitionTable.dataSource = self
    competitionTable.delegate = self
  }
}

extension CompetitionViewController: UITableViewDelegate, UITableViewDataSource {
  
  //MARK: - Datasource Methods
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayOfCompetition.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: K.CompetitionTableViewCell, for: indexPath) as! CompetionTableViewCell
    let model = arrayOfCompetition[indexPath.row]
    cell.configure(cell: model)
    return cell
  }
  
  //MARK: - Delegate Methods
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = .systemBackground
    let sectionLabel = setUpHeader(with: "CОРЕВНОВАНИЯ", tableView)
    headerView.addSubview(sectionLabel)
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 60
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
