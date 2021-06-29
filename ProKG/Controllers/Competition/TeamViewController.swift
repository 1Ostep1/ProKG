//
//  TeamViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit
import XLPagerTabStrip

class TeamViewController: UIViewController, IndicatorInfoProvider {
  //MARK: - Outlets

  @IBOutlet weak var teamTableView: UITableView!

  //MARK: - Properties
  private var arr = ["","","","",""]
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureCollView()
    // Do any additional setup after loading the view.
  }
  
  //MARK: - Actions
  
  private func configureCollView() {
    teamTableView.delegate = self
    teamTableView.dataSource = self
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Команда")

  }
  
}
extension TeamViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "numCell", for: indexPath)
      return cell
    } else if indexPath.row < arr.count {
      let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell", for: indexPath)
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "sumCell", for: indexPath)
      return cell 
    }
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.row == 0, indexPath.row == 6{
      return 44.5
    } else {
      return 90
    }
  }
}
