//
//  SportsmenRequestViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 23/6/21.
//

import UIKit

class SportsmenRequestViewController: UIViewController {
  
  //MARK: - Outlets
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var sendRequstBtn: UIButton!
  //MARK: - Properties
  private var isChecked = false
  var titl = ""
  //MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    titleLabel.text = titl
    configureUI()
    // Do any additional setup after loading the view.
  }
  //MARK: - Actions
  @IBAction func sendRequestTapped(_ sender: UIButton) {
    createAlert(with: "Сообщение", message: "Ваша заявка на участие отправлена к Федерации, ждите ответа.")
  }
  private func configureUI() {
    sendRequstBtn.makeCircledCorner(with: .competitionCategory, radius: 8, cornerColor: .clear)
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: SportsmenRequestCellTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: SportsmenRequestCellTableViewCell.identifier)
  }
}
  //MARK: - Extension
extension SportsmenRequestViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: SportsmenRequestCellTableViewCell.identifier, for: indexPath) as! SportsmenRequestCellTableViewCell
    cell.configureCell()
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let cell = self.tableView.cellForRow(at: indexPath) as! SportsmenRequestCellTableViewCell
    cell.isChecked = !cell.isChecked
    tableView.reloadData()
  }
}
