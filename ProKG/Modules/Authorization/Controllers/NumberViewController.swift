//
//  NumberViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit
import FirebaseAuth

class NumberViewController: UIViewController {
  
  //MARK: - Outlets 
  
  @IBOutlet weak var shadowView: UIView!
  @IBOutlet weak var numberField: UITextField!
  @IBOutlet weak var logInBtn: UIButton!
  
  //MARK: - Properties
  
  private var currentVerificationId = ""
  private lazy var confirmController = ConfirmationViewController.getVC(storyboardName: Storyboards.Auth.rawValue) 
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    configureTextField()
    setupBackButton()
    shadowView.applyBlurEffect(with: .prominent)
    shadowView.makeCircledCorner(with: .black, radius: shadowView.frame.height/10)
    logInBtn.makeCircledCorner(with: .competitionCategory, radius: 5, cornerColor: .clear)
  }
  
  //MARK: - Placeholder Color
  
  private func configureTextField() {
    numberField.setUpPlaceHolderColor(with: .darkGray, text: "+996 (XXX) XX-XX-XX")
    numberField.layer.cornerRadius = 5
    numberField.layer.masksToBounds = true
    numberField.keyboardType = .numberPad
    numberField.delegate = self
  }
  
  //MARK: - Actions
  
  @IBAction func logIn(_ sender: UIButton) {
//    Auth.auth().languageCode = "en"
//    guard let phoneNumber = numberField.text, !(phoneNumber.count <= 12) else {
//      createAlert(with: "ERROR", message: "NOT CORRECT PHONE NUMBER")
//      return
//    }
//    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
//      if let error = error {
//        print(error.localizedDescription)
//        self.createAlert(with: "ERROR", message: "NOT CORRECT PHONE NUMBER")
//        return
//      }
//      K.Deafaults.veificationID = verificationID!
//      self.navigationController?.pushViewController(self.confirmController, animated: true)
//    }
    self.navigationController?.pushViewController(self.confirmController, animated: true)

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
