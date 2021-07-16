//
//  SplashViewController.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 28/6/21.
//

import UIKit

class SplashViewController: UIViewController {
  
  @IBOutlet weak var indicator: UIActivityIndicatorView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    indicator.startAnimating()
    indicator.hidesWhenStopped = true
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { 
      let controller = TabBarViewController.getVC(storyboardName: Storyboards.Main.rawValue)
      self.present(controller, animated: true)
    }
  }
}
