import UIKit

class NewsTableViewCell: UITableViewCell {
  
  //MARK: - Outlets
  
  @IBOutlet weak var newsImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  @IBOutlet weak var categoryLabel: UILabel!
  
  //MARK: - Life Cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    categoryLabel.makeCircledBorder()
    newsImageView.setShadowOffset()
  }
  override func layoutSubviews() {
    super.layoutSubviews()
    let margins = UIEdgeInsets(top: 0, left: 0, bottom: 15, right: 0)
    contentView.frame = contentView.frame.inset(by: margins)
  }
  //MARK: - Configure Cell
  
  func setUpCell(with cell: NewsModel) {
//    newsImageView.downloadImage(with: cell.image ?? "")
    newsImageView.image = UIImage(named: "basketball")
    titleLabel.text = cell.title
    dateLabel.text = cell.createdAt
    categoryLabel.text = "БАСКЕТБОЛ"
  }
}
