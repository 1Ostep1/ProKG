//
//  DoneRegistrationViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 3/6/21.
//

import UIKit

class DoneRegistrationViewController: UIViewController {

  @IBOutlet var shadowView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    shadowView.applyBlurEffect(with: .prominent)
    shadowView.makeCircledCorner(with: .black, radius: shadowView.frame.height/10)
    setupBackButton()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { 
      let controller = TrainerMainProfileViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
      self.navigationController?.pushViewController(controller, animated: true)
    }
  }
}
