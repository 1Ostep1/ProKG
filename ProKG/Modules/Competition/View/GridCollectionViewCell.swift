//
//  GridCollectionViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 17/6/21.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell {
  
  //MARK: - Identifier
  
  static let identifier = "gridCell"
  
  //MARK: - Outlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var pointsLabel: UILabel!
  @IBOutlet weak var nameLabelOpon: UILabel!
  @IBOutlet weak var imageViewOpon: UIImageView!
  @IBOutlet weak var pointsLabelOpon: UILabel!

  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    
  }
  
  //MARK: - Configure Cell
  
  func configureCell(with model: GridModel) {
    imageView.makeCircledCorner(with: .clear, radius: 10)
    nameLabel.text = model.name
    nameLabelOpon.text = model.nameOpon
    imageView.image = UIImage(named: model.image ?? "")
    imageViewOpon.image = UIImage(named: model.imageOpon ?? "")
    pointsLabel.text = model.points
    pointsLabelOpon.text = model.pointsOpon
  }
}
