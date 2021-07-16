//
//  WeightCollectionViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit

class WeightCollectionViewCell: UICollectionViewCell {
  //MARK: - Outlets
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var sportsmenCount: UILabel!

  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  //MARK: - Actions
  func configureCell(model: weightCategoryModel) {
    weightLabel.text = "до \(model.weight ?? "0") кг"
    sportsmenCount.text = "\(model.count ?? "0") атлетов"
  }
}
