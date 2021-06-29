//
//  labelExtension.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 3/6/21.
//

import UIKit
import Alamofire
import AlamofireImage

extension UILabel {
  func compColor(_ text: String) {
    self.backgroundColor = (text == "Завершено") ? UIColor.blue.withAlphaComponent(0.8) : UIColor.init(named: "RegistrationColor")?.withAlphaComponent(0.8)
  }
  func makeCircledBorder() {
    self.layer.cornerRadius = 5
    self.layer.masksToBounds = true
  }
  func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
    guard let labelText = self.text else { return }
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    paragraphStyle.lineHeightMultiple = lineHeightMultiple
    let attributedString:NSMutableAttributedString
    if let labelattributedText = self.attributedText {
      attributedString = NSMutableAttributedString(attributedString: labelattributedText)
    } else {
      attributedString = NSMutableAttributedString(string: labelText)
    }
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
    self.attributedText = attributedString
  }
}
extension UITextField {
  func setUpPlaceHolderColor(with color: UIColor, text: String) {
    self.attributedPlaceholder = NSAttributedString(string: text, attributes: [NSAttributedString.Key.foregroundColor: color])
  } 
}
extension UIView {
  func makeCircledCorner(with backgroundColor: UIColor = .red, radius: CGFloat = 5, cornerColor: UIColor = .clear) {
    self.layer.cornerRadius = radius
    self.layer.borderColor = cornerColor.cgColor
    self.layer.borderWidth = 1
    self.layer.masksToBounds = true
    self.backgroundColor = backgroundColor
  }
  func applyBlurEffect(with style: UIBlurEffect.Style = .dark) {
    let blurEffect = UIBlurEffect(style: style)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = bounds
    blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    addSubview(blurEffectView)
  }
  func setShadowOffset() {
    self.alpha = 0.8
    self.layer.shadowColor = UIColor.black.cgColor
    self.clipsToBounds = false
    self.layer.shadowOffset = CGSize(width: 0, height: 3)
    self.layer.shadowRadius = 1
    self.layer.shadowOpacity = 0.5
    self.layer.shadowRadius = 10
  }
}
extension UIImageView {
  func downloadImage(with url: String) {
    guard let url = URL(string: url) else {return}
    Alamofire.request(url).responseImage { response in
      if case .success(let image) = response.result {
        DispatchQueue.main.async {
          self.image = image
        }
      } else {
        print(response.error as Any)
      }
    }
  }
}
extension UIButton {
  public class var yourAttributes: [NSAttributedString.Key: Any] {
    return [
      .font: UIFont.systemFont(ofSize: 14),
      .foregroundColor: UIColor.competitionCategory,
      .underlineStyle: NSUnderlineStyle.single.rawValue
    ] 
  }
  func alignTextBelow(spacing: CGFloat = 6.0){
    if let image = self.imageView?.image {
      let imageSize: CGSize = image.size
      self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -imageSize.width, bottom: -(imageSize.height), right: 0.0)
      guard let nsString = self.titleLabel?.text else {return}
      let labelString = NSString(string: nsString)
      let titleSize = labelString.size(withAttributes: [NSAttributedString.Key.font: self.titleLabel!.font!])
      self.imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing), left: 0.0, bottom: 0.0, right: -titleSize.width)
    }
  }
}
@IBDesignable class PaddingLabel: UILabel {
  
  @IBInspectable var topInset: CGFloat = 5.0
  @IBInspectable var bottomInset: CGFloat = 5.0
  @IBInspectable var leftInset: CGFloat = 16.0
  @IBInspectable var rightInset: CGFloat = 16.0
  
  override func drawText(in rect: CGRect) {
    let insets = UIEdgeInsets.init(top: topInset, left: leftInset, bottom: bottomInset, right: rightInset)
    super.drawText(in: rect.inset(by: insets))
  }
  
  override var intrinsicContentSize: CGSize {
    let size = super.intrinsicContentSize
    return CGSize(width: size.width + leftInset + rightInset,
                  height: size.height + topInset + bottomInset)
  }
}
