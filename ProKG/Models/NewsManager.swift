import Foundation
import Alamofire

protocol NewsManagerDelegate {
    func didUpdateNews(news: [NewsModel])
    func didFailWithError(_ error: Error)
}

class NewsManager {
  var delegate: NewsManagerDelegate?
  
  func fetchRequest() {
    let urlString = "http://167.71.36.59:8000/api/main/news/"
    Alamofire.request(urlString).responseData { response in
      switch response.result {
      case .failure(let error):
        self.delegate?.didFailWithError(error)
      case .success(let data):
        do {
          let decodedData = try JSONDecoder().decode([NewsModel].self, from: data)
          DispatchQueue.main.async {
            self.delegate?.didUpdateNews(news: decodedData)
          }
        } catch let error {
          self.delegate?.didFailWithError(error)
        }
      }
    }
  }
}
