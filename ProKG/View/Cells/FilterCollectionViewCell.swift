//
//  FilterCollectionViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 21/6/21.
//

import UIKit

class FilterCollectionViewCell: UICollectionViewCell {
  //MARK: - Outlets
  
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  
  //MARK: - Properties
  
  static var identifier = "filterCell"
  static var nibName = "FilterCollectionViewCell"

  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    self.makeCircledCorner(with: .clear, radius: 8)
  }
  
  //MARK: - Configure Cell
  
  func configure<T>(model: T) {
    switch model {
    case is FilterModel:
      let model = model as! FilterModel
      titleLabel.text = model.name
      imageLabel.image = UIImage(named: model.image ?? "")
      print("Model")
    default:
      print("error")
    }
  }
}
