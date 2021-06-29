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
  
  private lazy var numberController = NumberViewController.getVC(storyboardName: Storyboards.Auth.rawValue)
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton() 
    setupTransparentNavigationBar()
    configureButton()
  }
  
  //MARK: - Actions
  private func configureButton() {
    judgeBtn.alignTextBelow()
    trainerBtn.alignTextBelow()
    blurView.applyBlurEffect(with: .prominent)
    blurView1.applyBlurEffect(with: .prominent)
    blurView.makeCircledCorner(with: .black, radius: blurView.frame.height/10)
    blurView1.makeCircledCorner(with: .black, radius: blurView.frame.height/10)
  }
  @IBAction func judgeTapped(_ sender: UIButton) {
    let controller = JudgeProfileViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  @IBAction func trainerTapped(_ sender: UIButton) {
    navigationController?.pushViewController(numberController, animated: true)
  }
}
