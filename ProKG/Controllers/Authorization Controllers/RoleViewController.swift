//
//  RoleViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit

class RoleViewController: UIViewController {

  //MARK: - Outlets
  
  @IBOutlet weak var blurView: UIView!
  @IBOutlet weak var blurView1: UIView!
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
    configureButton()
  }
  
  //MARK: - Actions
  private func configureButton() {
    judgeBtn.alignTextBelow()
    trainerBtn.alignTextBelow()
    blurView.applyBlurEffect()
    blurView1.applyBlurEffect()
    blurView.makeCircledCorner()
    blurView1.makeCircledCorner()
  }
  @IBAction func judgeTapped(_ sender: UIButton) {
    navigationController?.pushViewController(numberController, animated: true)
  }
  @IBAction func trainerTapped(_ sender: UIButton) {
    navigationController?.pushViewController(numberController, animated: true)
  }
}
