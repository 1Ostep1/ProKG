//
//  NumberViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit

class NumberViewController: UIViewController {
  
  //MARK: - Outlets 
  
  @IBOutlet var shadowView: UIView!
  @IBOutlet var numberField: UITextField!
  
  //MARK: - Properties
  
  private lazy var confirmController = ControllerFactory.confirmController()
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    shadowView.doShadow()
    configureTextField()
    setupBackButton()
  }
  
  //MARK: - Placeholder Color
  
  private func configureTextField() {
    numberField.setUpPlaceHolderColor(with: .darkGray, text: "+996 (505) 21-11-02")
    numberField.layer.cornerRadius = 5
    numberField.layer.masksToBounds = true
    numberField.keyboardType = .numberPad
    numberField.delegate = self
  }
  
  //MARK: - Actions
  
  @IBAction func logIn(_ sender: UIButton) {
    navigationController?.pushViewController(confirmController, animated: true)
  }
}
//MARK: - Phone mask (+996 (505)-21-11-02)

extension NumberViewController: UITextFieldDelegate {
  func format(with mask: String, phone: String) -> String {
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex
    for ch in mask where index < numbers.endIndex {
      if ch == "X" {
        result.append(numbers[index])
        index = numbers.index(after: index)
      } else {
        result.append(ch)
      }
    }
    return result
  }
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let text = textField.text else { return false }
    let newString = (text as NSString).replacingCharacters(in: range, with: string)
    textField.text = format(with: "+XXX (XXX) XX-XX-XX", phone: newString)
    return false
  }
}
