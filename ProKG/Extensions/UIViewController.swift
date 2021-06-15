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
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "SFUIDisplay-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)]
    navigationController?.navigationBar.isTranslucent = true
  }
  func setUpScrollViewContent(with view: UIScrollView, _ size: CGFloat) {
    view.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + size)
  }
  func setUpLogoToTitle() {
    let logo = UIImage(named: "ICON.png")
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 25))
    imageView.image = logo
    imageView.tintColor = .white
    imageView.contentMode = .scaleAspectFit
    self.navigationItem.titleView = imageView
  }
  func setUpHeader(with text: String, _ tableView: UITableView) -> UIView {
    let sectionLabel = UILabel(frame: CGRect(x: 8,
                                             y: 0,
                                             width: tableView.bounds.size.width,
                                             height: tableView.bounds.size.height))
    sectionLabel.font = UIFont(name: "Oswald", size: 24)
    sectionLabel.textColor = .white
    sectionLabel.text = text
    sectionLabel.sizeToFit()
    return sectionLabel
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
}
