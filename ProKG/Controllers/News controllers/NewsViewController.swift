import UIKit

class NewsViewController: UIViewController {
  
  //MARK: - Outlet
  
  @IBOutlet weak var newsTableView: UITableView!
  
  //MARK: - Properties
  
  private lazy var detailController = DetailViewController.getVC(storyboardName: Storyboards.News.rawValue)
  private var newsArray = [NewsModel]()
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupBackButton(with: "")
    setUpLogoToTitle()
    configureTable()
    getInfoFromServer()
    setupTransparentNavigationBar()
  }
  
  //MARK: - Actions
  
  @IBAction func filterTapped(_ sender: UIButton) {
    let controller = FilteredViewController.getVC(storyboardName: Storyboards.News.rawValue)
    navigationController?.pushViewController(controller, animated: true)
  }
  
  //MARK: - Information From Server 
  
  private func getInfoFromServer() {
    ServerManager.shared.getNews { (news) in
      self.newsArray = news
      self.newsTableView.reloadData()
    } error: { (err) in
      print(err)
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
//    detailController.configure(model)
    navigationController?.pushViewController(detailController, animated: false)
  }
  //MARK: - Layout Methods
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
}
