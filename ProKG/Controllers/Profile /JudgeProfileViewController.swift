//
//  JudgeProfileViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class JudgeProfileViewController: UIViewController {
  
  //MARK: - Outlet
  
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var compTableView: UITableView!
  
  //MARK: - Properties
  
  private var arrayOfCompetition = [EventsModel]()  
  private let model1 = EventsModel(title: "Открытое первенство по Тхэквандо", category: "TAЭКВАНДО", type: "ЗАВЕРШЕНО", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  private let model = EventsModel(title: "Открытое первенство по Тхэквандо", category: "TAЭКВАНДО", type: "РЕГИСТРАЦИЯ ОТКРЫТА", startDate: "14.04.2024", endDate: "14.04.2024", image: "https://i.pinimg.com/originals/eb/b8/c3/ebb8c34f412a2fd6559ee94b0d204291.jpg")
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTable()
    setupBackButton(with: "Назад")
  }
  
  //MARK: - Configure TableView
  private func configureTable() {
    guard let name = nameLabel.text,
          let surname = nameLabel.text
    else {return}
    imageLabel.layer.cornerRadius = 50
    setDefaultImage(name: name, surname: surname, image: imageLabel)
    compTableView.delegate = self
    compTableView.dataSource = self
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    arrayOfCompetition.append(model)
    arrayOfCompetition.append(model1)
    compTableView.register(UINib(nibName: CompetionTableViewCell.nibName, bundle: nil),
                           forCellReuseIdentifier: CompetionTableViewCell.identifier)
  }
}
extension JudgeProfileViewController: UITableViewDelegate, UITableViewDataSource {
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
    let controller = CompJudgeViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
