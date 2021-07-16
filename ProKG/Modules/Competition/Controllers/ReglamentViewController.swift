//
//  ReglamentViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit
import XLPagerTabStrip

class ReglamentViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets
  
  @IBOutlet weak var membersTableView: UITableView!
  @IBOutlet weak var statisticsTableView: UITableView!
  @IBOutlet weak var dateAndTimeLabel: UILabel!
  @IBOutlet weak var addressLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var registeredLabel: UILabel!
  
  @IBOutlet weak var protocolPDFBtn: UIButton!
  //MARK: - Properties
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTable()
  }
  //MARK: - Actions
  
  private func configureTable() {
    membersTableView.dataSource = self
    membersTableView.delegate = self
    //    membersTableView.register(UINib(nibName: <#T##String#>, bundle: nil), forCellReuseIdentifier: <#T##String#>)
    statisticsTableView.dataSource = self
    statisticsTableView.delegate = self
    //    statisticsTableView.register(UINib(nibName: <#T##String#>, bundle: nil), forCellReuseIdentifier: <#T##String#>)
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Регламент")
  }
  @IBAction func openPdfTapped(_ sender: UIButton) {
    let controller = PDFViewController.getVC(storyboardName: Storyboards.Main.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  
}
extension ReglamentViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if tableView == statisticsTableView {
      return 6
    }
    return 4
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if tableView == statisticsTableView {
      switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "sumCell", for: indexPath)
        return cell
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        return cell
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "clubCell", for: indexPath)
        return cell
      case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "concCell", for: indexPath)
        return cell
      case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainerCell", for: indexPath)
        return cell
      case 5: 
        let cell = tableView.dequeueReusableCell(withIdentifier: "judgeCell", for: indexPath)
        return cell
      default:
        createAlert(with: "Error", message: "")
        return UITableViewCell()
      }
    } else {
      switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "memAgeCell", for: indexPath)
        return cell
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "childCell", for: indexPath)
        return cell
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "child8Cell", for: indexPath)
        return cell
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "child10Cell", for: indexPath)
        return cell
      }
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 45
  }
}
