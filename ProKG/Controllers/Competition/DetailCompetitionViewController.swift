//
//  CompetitionFilterViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/26/21.
//

import UIKit

class DetailCompetitionViewController: UIViewController {
  
  @IBOutlet var first: UIView!
  @IBOutlet var second: UIView!
  @IBOutlet var typeControl: UISegmentedControl!
  override func viewDidLoad() {
    super.viewDidLoad()
    let titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    typeControl.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
    typeControl.setTitleTextAttributes(titleTextAttributes, for: .selected)
    // Do any additional setup after loading the view.

  }
  
  @IBAction func action(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      first.isHidden = false
      second.isHidden = true
    case 1:
      first.isHidden = true
      second.isHidden = false
    default:
        break
    }
  }
}
