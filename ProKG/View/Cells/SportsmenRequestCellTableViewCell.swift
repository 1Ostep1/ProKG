//
//  SportsmenRequestCellTableViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 23/6/21.
//

import UIKit

class SportsmenRequestCellTableViewCell: UITableViewCell {

  //MARK: - Outlets
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var imageLabel: UIImageView!
  
  //MARK: - Properties
  static var identifier = "spRequestCell"
  static var nibName = "SportsmenRequestCellTableViewCell" 
  public var isChecked = false
  
  //MARK: - Life Cycle
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  //MARK: - Actions
  func configureCell() {
    if isChecked {
      imageLabel.image = UIImage(named: "checked")
    } else {
      imageLabel.image = UIImage(named: "unChecked")
    }
    nameLabel.text = "Akmatov Azamat Akmatovich"
  }
}
