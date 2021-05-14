import UIKit
import Alamofire
import AlamofireImage

extension UIImageView {
  func downloadImage(with url: String) {
    guard let url = URL(string: url) else {return}
    Alamofire.request(url).responseImage { response in
      if case .success(let image) = response.result {
        self.image = image
      }
    }
  }
}
