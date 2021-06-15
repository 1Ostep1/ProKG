import UIKit

class NewsViewController: UIViewController {
  
  //MARK: - Outlet
  
  @IBOutlet weak var newsTableView: UITableView!
  
  //MARK: - Properties
  
  private lazy var detailController = ControllerFactory.detailNewsController()
  private var newsArray = [NewsModel]()
  
  //MARK: - Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUpLogoToTitle()
    configureTable()
    getInfoFromServer()
    setupTransparentNavigationBar()
  }
  
  //MARK: - Information From Server 
  
  private func getInfoFromServer() {
    ServerManager.shared.getNews(token: K.Deafaults.token) { (news) in
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
    detailController.configure(model)
    navigationController?.pushViewController(detailController, animated: false)
  }
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView()
    headerView.backgroundColor = .systemBackground
    let sectionLabel = setUpHeader(with: "НОВОСТИ", tableView)
    headerView.addSubview(sectionLabel)
    headerView.addSubview(sectionLabel)
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 60
  }
  
  //MARK: - Layout Methods
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 180
  }
}
