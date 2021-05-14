import UIKit

class NewsTableViewCell: UITableViewCell {
  @IBOutlet var newsImageView: UIImageView!
  @IBOutlet var titleLabel: UILabel!
  @IBOutlet var dateLabel: UILabel!
  @IBOutlet var timeLabel: UILabel!
  @IBOutlet var bodyLabel: UILabel!
  
  override func awakeFromNib() {
      super.awakeFromNib()
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    newsImageView = UIImageView()
    titleLabel.text = ""
    dateLabel.text = ""
    timeLabel.text = ""
    bodyLabel.text = ""
  }
  
  func setUpCell(with cell: NewsModel) {
    newsImageView.downloadImage(with: cell.images[0].image)
    titleLabel.text = cell.title
    dateLabel.text = cell.date
    timeLabel.text = cell.time
    bodyLabel.text = cell.body
  }
}
