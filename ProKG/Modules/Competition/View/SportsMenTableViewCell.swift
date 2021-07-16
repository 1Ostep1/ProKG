//
//  SportMenTableViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 24/6/21.
//

import UIKit

class SportsmenTableViewCell: UITableViewCell {
  
  //MARK: - Outlets
  
  @IBOutlet weak var imageLabel: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var weightLabel: UILabel!
  @IBOutlet weak var ageLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var federationLabel: UILabel!
  @IBOutlet weak var placeLabel: UILabel!
  
  //MARK: - Properties
  static let identifier = "resultCell"
  static let nibName = "SportsmenTableViewCell"
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    placeLabel.makeCircledCorner(with: .competitionCategory, radius: 4)
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    let margins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    contentView.frame = contentView.frame.inset(by: margins)
  }
  
  //MARK: - Configure Cell
  func configureCell(model: ResultModel) {
    imageLabel.image = UIImage(named: model.image ?? "")
    nameLabel.text = model.name
    weightLabel.text = model.weight
    ageLabel.text = model.age
    cityLabel.text = "\(String(describing: model.city)), \(String(describing: model.federation))"
    placeLabel.text = model.place
  }
}
