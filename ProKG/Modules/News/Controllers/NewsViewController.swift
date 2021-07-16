import UIKit

class NewsViewController: UIViewController {
  
  
  @IBOutlet weak var newsTableView: UITableView!
  
  private lazy var detailController = DetailViewController.getVC(storyboardName: Storyboards.News.rawValue) as! DetailViewController
  private var newsArray = [NewsModel]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton(with: "")
    setUpLogoToTitle()
    configureTable()
    getInfoFromServer()
    setupTransparentNavigationBar()
  }
  
  @IBAction func filterTapped(_ sender: UIButton) {
    let controller = FilteredViewController.getVC(storyboardName: Storyboards.News.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  
  private func getInfoFromServer() {
    ServerManager.shared.getEvents(token: "") { (news) in
      self.newsArray = news
      self.newsTableView.reloadData()
    } error: { _ in
      print("error")
    }

  }
  //MARK: - Configure Tableview
  
  private func configureTable() {
    newsTableView.delegate = self
    newsTableView.dataSource = self
    newsTableView.register(UINib(nibName: K.newsCellNibName, bundle: nil), forCellReuseIdentifier: K.newsCell)
  }
}
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
  
  //MARK: - DataSource Methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return newsArray.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: K.newsCell, for: indexPath) as! NewsTableViewCell
    let model = newsArray[indexPath.row]
    cell.setUpCell(with: model)
    return cell
  }
  //MARK: - Delegate Methods
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let model = newsArray[indexPath.row]
    detailController.configure(model)
    navigationController?.pushViewController(detailController, animated: false)
  }
  //MARK: - Layout Methods
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
}
