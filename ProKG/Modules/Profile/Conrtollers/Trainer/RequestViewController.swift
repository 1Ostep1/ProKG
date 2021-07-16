//
//  RequestViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 23/6/21.
//

import UIKit

class RequestViewController: UIViewController {
  
  //MARK: - Outlets
  
  @IBOutlet weak var dateAndTimeLabel: UILabel!
  @IBOutlet weak var adressLabel: UILabel!
  @IBOutlet weak var phoneLabel: UILabel!
  @IBOutlet weak var countOfRegisteredLabel: UILabel!
  @IBOutlet weak var pdfBtn: UIButton!
  @IBOutlet weak var sendRequestBtn: UIButton!
  
  //MARK: - Properties
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureUI()
  }
  //MARK: - Actions
  private func configureUI() {
    dateAndTimeLabel.text = ""
    adressLabel.text = ""
    phoneLabel.text = ""
    countOfRegisteredLabel.text = "Зарегистрированно: "
    let attributeString = NSMutableAttributedString(
      string: "Протокол ссылка PDF",
      attributes: UIButton.yourAttributes
    )
    pdfBtn.setAttributedTitle(attributeString, for: .normal)
    sendRequestBtn.makeCircledCorner(with: .competitionCategory, radius: 8)
    
  }
  
  @IBAction func openPdfTapped(_ sender: UIButton) {
    let controller = PDFViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  @IBAction func sendRequestTapped(_ sender: UIButton) {
    let controller = CategoryRequestViewController.getVC(storyboardName: Storyboards.Profile.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
}
