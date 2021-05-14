import UIKit

class NewsViewController: UIViewController {
  @IBOutlet var newsTableView: UITableView!
  private var newsManager = NewsManager()
  private var newsArray: [NewsModel] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    newsTableView.delegate = self
    newsTableView.dataSource = self
    newsTableView.register(UINib(nibName: K.newsCellNibName, bundle: nil), forCellReuseIdentifier: K.newsCell)
    newsManager.delegate = self
    newsManager.fetchRequest()
    }
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
  //MARK: - DataSource Methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell, for: indexPath) as? NewsTableViewCell {
      let model = newsArray[indexPath.row]
      cell.setUpCell(with: model)
      return cell
    } else {
      fatalError()
    }
  }
  
  //Delegate Methods
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  //Layout Methods
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return CGFloat(110)
  }
}

extension NewsViewController: NewsManagerDelegate {
  func didUpdateNews(news: [NewsModel]) {
    newsArray = news
    newsTableView.reloadData()
  }
  func didFailWithError(_ error: Error) {
    print(error.localizedDescription)
  }
}
