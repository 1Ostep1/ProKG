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
  private let model1 = EventsModel(title: "Открытое первенство по Тхэквандо", category: "TAЭКВАНДО", type: "ЗАВЕРШЕНО", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  private let model = EventsModel(title: "Открытое первенство по Тхэквандо", category: "TAЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  private let controller = DetailCompetitionViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
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
    competitionTable.register(UINib(nibName: CompetionTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: CompetionTableViewCell.identifier)
    competitionTable.dataSource = self
    competitionTable.delegate = self
  }
  @IBAction func filterTapped(_ sender: UIButton) {
    let controller = FilteredCompViewController.getVC(storyboardName: Storyboards.Competition.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}

extension CompetitionViewController: UITableViewDelegate, UITableViewDataSource {
  
  //MARK: - Datasource Methods
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return arrayOfCompetition.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: CompetionTableViewCell.identifier, for: indexPath) as! CompetionTableViewCell
    let model = arrayOfCompetition[indexPath.row]
    cell.configure(cell: model)
    return cell
  }
  
  //MARK: - Delegate Methods
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    navigationController?.pushViewController(controller, animated: true)
  }
}
