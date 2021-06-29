//
//  Navigation.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 14/6/21.
//

import UIKit

public extension UIViewController {
  func setupBackButton(with text: String = "") {
    self.navigationController?.navigationBar.topItem?.title = text
  }
  func setupTransparentNavigationBar() {
    navigationController?.navigationBar.barTintColor = .clear
    navigationController?.setNavigationBarHidden(false, animated: true)
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                               NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)]
    navigationController?.navigationBar.isTranslucent = true
  }
  func setUpScrollViewContent(with view: UIScrollView, _ size: CGFloat) {
    view.contentSize = CGSize(width: self.view.frame.width,
                              height: self.view.frame.height + size)
  }
  func setUpLogoToTitle() {
    let logo = UIImage(named: "LOGO.png")
    let imageView = UIImageView(image: logo)
    imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
    imageView.tintColor = .white
    imageView.contentMode = .center
    self.navigationItem.titleView = imageView
  }
  func createAlert(with title: String, message: String) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "OK", style: .cancel))
    self.present(alert, animated: true)
  }
  func hideKeyboardWhenTappedAround() {
    let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
    tap.cancelsTouchesInView = false            
    view.addGestureRecognizer(tap)
  }
  @objc func dismissKeyboard() {
    view.endEditing(true)
  }
  func setDefaultImage(name: String, surname: String, image: UIImageView) {
    let lblNameInitialize = UILabel()
    lblNameInitialize.frame.size = CGSize(width: 100.0, height: 100.0)
    lblNameInitialize.textColor = .competitionCategory
    lblNameInitialize.font = UIFont(name: "Lato-Regular", size: 50)
    lblNameInitialize.text = String(name.first!) + String(surname.first!)
    lblNameInitialize.textAlignment = .center
    lblNameInitialize.backgroundColor = .white
    lblNameInitialize.layer.cornerRadius = 50.0
    
    UIGraphicsBeginImageContext(lblNameInitialize.frame.size)
    lblNameInitialize.layer.render(in: UIGraphicsGetCurrentContext()!)
    image.image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
  }
}
