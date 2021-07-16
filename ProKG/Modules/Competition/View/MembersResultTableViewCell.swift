//
//  MembersResultTableViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 2/7/21.
//

import UIKit

class MembersResultTableViewCell: UITableViewCell {

  //MARK: - Outlets
  @IBOutlet weak var placeLabel: UILabel!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var organizationLabel: UILabel!

  //MARK: - Properties
  
  public static let identifier = "sportsmenResCell"

  //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  //MARK: - Actions
  public func configureCell(model: ResultModel) {
    placeLabel.text = model.place
    nameLabel.text = model.name
    cityLabel.text = model.city
    organizationLabel.text = model.federation
  }
}
