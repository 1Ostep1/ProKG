//
//  ConfirmationViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit

class ConfirmationViewController: UIViewController {

  //MARK: - Outlets
  
  @IBOutlet weak var confirmationCodeField: UITextField!
  @IBOutlet weak var confirmBtn: UIButton!
  @IBOutlet weak var resendBtn: UIButton!
  @IBOutlet weak var shadowView: UIView!
  
  //MARK: - Properties
  
  private lazy var registrationController = ControllerFactory.registrationController()
  private var code = ""
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    shadowView.doShadow()
    resendBtn.setUpBorder(with: .white)
    configureTextField()
    setupBackButton()

  }
  //MARK: - Configure Text Field
  
  private func configureTextField() {
    confirmationCodeField.setUpPlaceHolderColor(with: .darkGray, text: "-- -- --")
    confirmationCodeField.delegate = self
    confirmationCodeField.keyboardType = .numberPad
  }
  
  //MARK: - Actions
  @IBAction func confirmTapped(_ sender: UIButton) {
    print("confirmed with \(code)")
    navigationController?.pushViewController(registrationController, animated: true)
  }
  @IBAction func resendTapped(_ sender: UIButton) {
  }
}
//MARK: - Code mask

extension ConfirmationViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    guard let text = textField.text else { return false }
    let newString = (text as NSString).replacingCharacters(in: range, with: string)
    textField.text = format(with: "XX-XX-XX", phone: newString)
    return false
  }
  func format(with mask: String, phone: String) -> String {
    let numbers = phone.replacingOccurrences(of: "[^0-9]", with: "", options: .regularExpression)
    var result = ""
    var index = numbers.startIndex
    for ch in mask where index < numbers.endIndex {
      if ch == "X" {
        code.append(numbers[index])
        result.append(numbers[index])
        index = numbers.index(after: index)
      } else {
        result.append(ch)
      }
    }
    return result
  }
}
