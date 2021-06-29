//
//  CompJudgeViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class CompJudgeViewController: UIViewController {
  
  //MARK: - Outlets
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var startDateLabel: UILabel!
  @IBOutlet weak var endDateLabel: UILabel!
  @IBOutlet weak var judgeDateLabel: UILabel!
  @IBOutlet weak var judgeTimeLabel: UILabel!
  @IBOutlet weak var categoryBtn: UIButton!
  //MARK: - Properties
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    categoryBtn.makeCircledCorner(with: .competitionCategory, radius: 8, cornerColor: .clear)
    setupBackButton(with: "Назад")

  }
  
  //MARK: - Actions
  @IBAction func categoryTapped(_ sender: UIButton) {
    let controller = CategoryJudgeViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
