//
//  DataTrainerViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 22/6/21.
//

import UIKit
import XLPagerTabStrip

class DataTrainerViewController: UIViewController, IndicatorInfoProvider {
  
  //MARK: - Outlets 
  
  @IBOutlet weak var surnameTField: UITextField!
  @IBOutlet weak var nameTField: UITextField!
  @IBOutlet weak var patronomicTField: UITextField!
  @IBOutlet weak var cityTField: UITextField!
  @IBOutlet weak var phoneTField: UITextField!
  @IBOutlet weak var typeSportTField: UITextField!
  @IBOutlet weak var typeTField: UITextField!
  @IBOutlet weak var placeTFIeld: UITextField!
  @IBOutlet weak var saveBtn: UIButton!
  
  //MARK: - Properties
  private var imageView: UIImageView!
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureTextFields() 
  }
  
  
  
  //MARK: - Actions
  private func configureTextFields() {
//    guard let name = nameTField.text,
//          let surname = surnameTField.text
//    else {return}

  }
  @IBAction func saveTapped(_ sender: UIButton) {
    
  }
  
  func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
    return IndicatorInfo(title: "Данные")
  }
  
}
