//
//  ConfirmationViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit
import FirebaseAuth

class ConfirmationViewController: UIViewController {

  //MARK: - Outlets
  
  @IBOutlet weak var confirmationCodeField: UITextField!
  @IBOutlet weak var confirmBtn: UIButton!
  @IBOutlet weak var resendBtn: UIButton!
  @IBOutlet weak var shadowView: UIView!
  
  //MARK: - Properties
  
  private lazy var registrationController = RegistrationViewController.getVC(storyboardName: Storyboards.Auth.rawValue)
  private var code = ""
  private var phoneNumb = "+996505211102"

  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    hideKeyboardWhenTappedAround()
    shadowView.applyBlurEffect(with: .prominent)
    shadowView.makeCircledCorner(with: .black, radius: 16)
    resendBtn.makeCircledCorner(with: .clear, radius: 5, cornerColor: .white)
    confirmBtn.makeCircledCorner(with: .competitionCategory, radius: 5, cornerColor: .clear)
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
    verifyNumberWith(verificationCode: code)
    self.navigationController?.pushViewController(self.registrationController, animated: true)
  }
  @IBAction func resendTapped(_ sender: UIButton) {
    sendOTPCode(with: phoneNumb)
  }
  private func verifyNumberWith(verificationCode: String) {
//    let credential = PhoneAuthProvider.provider().credential(
//      withVerificationID: K.Deafaults.veificationID,
//      verificationCode: verificationCode)
//    Auth.auth().signIn(with: credential) { (authResult, error) in
//      self.navigationController?.pushViewController(self.registrationController, animated: true)
//    }
  }
  private func sendOTPCode(with phoneNumber:String){
    PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { (verificationID, error) in
      if let error = error {
        print(error.localizedDescription)
        return
      }else{
        print(verificationID!)
//        K.Deafaults.veificationID = verificationID!
      }
    }
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
