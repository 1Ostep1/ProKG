//
//  StartJudgeViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit
import Photos

class StartJudgeViewController: UIViewController {
  
  //MARK: - Outlets
  
  @IBOutlet weak var compImageLabel: UIImageView!
  @IBOutlet weak var startDateCompLabel: UILabel!
  @IBOutlet weak var endDateCompLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var judgeDateLabel: UILabel!
  @IBOutlet weak var judgeTimeLabel: UILabel!
  @IBOutlet weak var judgeBtn: UIButton!
  @IBOutlet weak var categoryLabel: UILabel!
  
  //MARK: - Properties
  
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    judgeBtn.makeCircledCorner(with: .gray, radius: 8, cornerColor: .clear)
    setupBackButton(with: "Назад")
  }
  
  //MARK: - Actions
  @IBAction func JudgeTapped(_ sender: UIButton) {
    showAlert()
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
}
extension StartJudgeViewController:  UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  //MARK:- UIImagePickerViewDelegate.
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    self.dismiss(animated: true) {
//      [weak self] in  
      //      guard let self = self else {return}
      guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
      //Setting image to your image view
      print("loaded image \(image)")
    }
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}
