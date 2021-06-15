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
    shadowView.doShadow()
    setupBackButton()

  }
}
