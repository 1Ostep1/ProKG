//
//  RoleViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit

class RoleViewController: UIViewController {

  //MARK: - Outlets
  
  @IBOutlet weak var judgeBtn: UIButton!
  @IBOutlet weak var trainerBtn: UIButton!
  
  //MARK: - Properties
  
  private lazy var numberController = ControllerFactory.numberController()
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton() 
    judgeBtn.backgroundColor = UIColor(white: 0, alpha: 0.5)
    trainerBtn.backgroundColor = UIColor(white: 0, alpha: 0.5)
    setupTransparentNavigationBar()
    judgeBtn.alignTextBelow()
    trainerBtn.alignTextBelow()
  }
  
  //MARK: - Actions
  
  @IBAction func judgeTapped(_ sender: UIButton) {
    navigationController?.pushViewController(numberController, animated: true)
  }
  @IBAction func trainerTapped(_ sender: UIButton) {
    navigationController?.pushViewController(numberController, animated: true)
  }
}
