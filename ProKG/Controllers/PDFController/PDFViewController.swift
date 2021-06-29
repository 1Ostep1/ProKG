//
//  PDFViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 28/6/21.
//

import UIKit
import WebKit

class PDFViewController: UIViewController {

  //MARK: -  Outlets
  
  @IBOutlet weak var webView: WKWebView!
  
  //MARK: - Properties
  private var url = URL(string: "https://www.ets.org/s/toefl/pdf/toefl_student_test_prep_planner.pdf")
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    webView.load(NSURLRequest(url: url!) as URLRequest)
  }
}
