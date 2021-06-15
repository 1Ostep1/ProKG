//
//  CompetionTableViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/26/21.
//

import UIKit

class CompetionTableViewCell: UITableViewCell {
  @IBOutlet weak var compImage: UIImageView!
  @IBOutlet weak var compCategory: UILabel!
  @IBOutlet weak var compTitle: UILabel!
  @IBOutlet weak var startDate: UILabel!
  @IBOutlet weak var endDate: UILabel!
  @IBOutlet weak var type: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    compImage.setShadowOffset()
    
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    let margins = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
    contentView.frame = contentView.frame.inset(by: margins)
  }
  
  func configure(cell: EventsModel) {
//    compImage.downloadImage(with: cell.image)
    compImage.image = UIImage(named: "Taekwondo")
    type.text = cell.type
    compTitle.text = cell.title
    compCategory.text = cell.category
    startDate.text = cell.startDate
    endDate.text = cell.endDate
    type.compColor(cell.type)
  }
}
