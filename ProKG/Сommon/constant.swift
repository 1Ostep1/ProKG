import Foundation

struct K {
  static let newsCell = "newsCell"
  static let newsCellNibName = "NewsTableViewCell"
  static let CompetitionTableViewCell = "CompetitionTableViewCell"
  
  
  struct Segues {
    static let detailNews = "detailNews"
    static let filtration = "filtration"
    static let phoneView = "phoneView"
    static let confirmationView = "confirmationView"
    static let registrationView = "registrationView"
  }
  
  struct Deafaults {
    static let token = /*UserDefaults.standard.string(forKey: "token") as! String*/""
    static var veificationID: String {
      get {
        return UserDefaults.standard.string(forKey: "authVerificationID")!
      }
      set{ 
        UserDefaults.standard.setValue(self, forKey: "authVerificationID")
      }
    }
  }
}
