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
  
  //MARK: - Configure Cell
  
  func setUpCell(with cell: NewsModel) {
//    newsImageView.downloadImage(with: cell.image ?? "")
    newsImageView.image = UIImage(named: "basketball")
    titleLabel.text = cell.title
    dateLabel.text = cell.createdAt
    categoryLabel.text = "БАСКЕТБОЛ"
  }
}
