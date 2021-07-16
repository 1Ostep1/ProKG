//
//  TypeCompetitionCollectionViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 16/6/21.
//

import UIKit

class TypeCompetitionCollectionViewCell: UICollectionViewCell {

  //MARK: - Outlets
  
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var titleLabel: UILabel!
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
        // Initialization code
  }
  
  //MARK: - Configure 
  
  func configureCell(age: AgeModel) {
    titleLabel.text = age.title
    dateLabel.text = age.date
    imageLabel.image = UIImage(named: age.image ?? "")
  }
}
