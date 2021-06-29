//
//  RegistrationViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/31/21.
//

import UIKit
import Photos

class RegistrationViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
  //MARK: - Outlets
  
  @IBOutlet var shadowView: UIView!
  @IBOutlet var surnameField: UITextField!
  @IBOutlet var nameField: UITextField!
  @IBOutlet var patronymicField: UITextField!
  @IBOutlet var regionField: UITextField!
  @IBOutlet var sportCategory: UITextField!
  @IBOutlet var sportType: UITextField!
  @IBOutlet var organizationField: UITextField!
  @IBOutlet var PDFButton: UIButton!
  @IBOutlet var firstImage: UIImageView!
  @IBOutlet var secondImage: UIImageView!
  @IBOutlet var scrollView: UIScrollView!
  @IBOutlet var registrationBtn: UIButton!
  @IBOutlet weak var nameCorrectLabel: UILabel!
  @IBOutlet weak var surnameCorrectLabel: UILabel!
  @IBOutlet weak var patronCorrectName: UILabel!
  
  //MARK: - Properties
  
  private lazy var doneController = DoneRegistrationViewController.getVC(storyboardName: Storyboards.Auth.rawValue)
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton()
    comfigureUI()
  }
  
  //MARK: - Actions
  private func comfigureUI() {
    nameField.delegate = self
    surnameField.delegate = self
    patronymicField.delegate = self
    shadowView.applyBlurEffect(with: .prominent)
    shadowView.makeCircledCorner(with: .clear, radius: 16)
    surnameField.makeCircledCorner(with: .clear, radius: 8)
    nameField.makeCircledCorner(with: .clear, radius: 8)
    patronymicField.makeCircledCorner(with: .clear, radius: 8)
    regionField.makeCircledCorner(with: .clear, radius: 8)
    sportCategory.makeCircledCorner(with: .clear, radius: 8)
    sportCategory.makeCircledCorner(with: .clear, radius: 8)
    sportType.makeCircledCorner(with: .clear, radius: 8)
    organizationField.makeCircledCorner(with: .clear, radius: 8)
    PDFButton.makeCircledCorner(with: .clear, radius: 8, cornerColor: .white)
    firstImage.makeCircledCorner(with: .clear, radius: 8)
    secondImage.makeCircledCorner(with: .clear,radius: 8)
    firstImage.applyBlurEffect()
    secondImage.applyBlurEffect()
    registrationBtn.makeCircledCorner(with: .competitionCategory, radius: 8, cornerColor: .clear)
  }
  @IBAction func PDFTapped(_ sender: UIButton) {
    showAlert()
  }
  @IBAction func nextTapped(_ sender: UIButton) {
    navigationController?.pushViewController(doneController, animated: true)
  }
  @IBAction func removeSecondImage(_ sender: Any) {
    secondImage.image = UIImage()
  }
  @IBAction func removeFirstImage(_ sender: Any) {
    firstImage.image = UIImage()
  }
  
  //MARK: - Image Capture
  
  private func showAlert() {
    let alert = UIAlertController(title: "Image Selection", message: "From where you want to pick this image?", preferredStyle: .actionSheet)
    alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(action: UIAlertAction) in
      self.getImage(fromSourceType: .camera)
    }))
    alert.addAction(UIAlertAction(title: "Photo Album", style: .default, handler: {(action: UIAlertAction) in
      self.getImage(fromSourceType: .photoLibrary)
    }))
    alert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
    self.present(alert, animated: true, completion: nil)
  }
  
  //get image from source type
  private func getImage(fromSourceType sourceType: UIImagePickerController.SourceType) {
    if UIImagePickerController.isSourceTypeAvailable(sourceType) {
      let imagePickerController = UIImagePickerController()
      imagePickerController.delegate = self
      imagePickerController.sourceType = sourceType
      self.present(imagePickerController, animated: true, completion: nil)
    }
  }
  
  //MARK:- UIImagePickerViewDelegate.
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    self.dismiss(animated: true) { [weak self] in
      
      guard let self = self else {return}
      guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
      //Setting image to your image view
      if self.firstImage.image == nil {
        self.firstImage.image = image
      } else {
        self.secondImage.image = image
      }
    }
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
extension RegistrationViewController: UITextFieldDelegate {
  func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    do {
      let regex = try NSRegularExpression(pattern: ".*[^A-Za-z].*", options: [])
      if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
        textField.layer.borderColor = UIColor.red.cgColor
        switch textField {
        case nameField:
          nameCorrectLabel.isHidden = false
        case surnameField:
          surnameCorrectLabel.isHidden = false
        default:
          patronCorrectName.isHidden = false
        }
        return false
      }
    }
    catch {
      print("ERROR")
    }
    textField.layer.borderColor = UIColor.green.cgColor
    switch textField {
    case nameField:
      nameCorrectLabel.isHidden = true
    case surnameField:
      surnameCorrectLabel.isHidden = true
    default:
      patronCorrectName.isHidden = true
    }
    return true
  }
}

