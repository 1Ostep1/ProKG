//
//  womenCollectionViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 17/6/21.
//

import UIKit

class womenCollectionViewCell: UICollectionViewCell {
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
