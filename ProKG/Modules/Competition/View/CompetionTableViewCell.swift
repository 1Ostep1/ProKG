//
//  CompetionTableViewCell.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/26/21.
//

import UIKit

class CompetionTableViewCell: UITableViewCell {
  
  //MARK: - Outlets 
  
  @IBOutlet weak var compImage: UIImageView!
  @IBOutlet weak var compCategory: UILabel!
  @IBOutlet weak var compTitle: UILabel!
  @IBOutlet weak var startDate: UILabel!
  @IBOutlet weak var endDate: UILabel!
  @IBOutlet weak var type: UILabel!
  
  //MARK: - Properties
  
  static let identifier = "CompetitionCell"
  static let nibName = "CompetitionTableViewCell"
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    compImage.setShadowOffset()
    
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    let margins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    contentView.frame = contentView.frame.inset(by: margins)
    type.makeCircledCorner(with: .competitionCategory, radius: 4)
    compCategory.makeCircledCorner(with: .competitionRegistration, radius: 4)
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
