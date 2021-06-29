//
//  ControllerFactory.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 14/6/21.
//

import UIKit

enum Storyboards: String {
  case Main
  case Auth
  case News
  case Competition
  case Profile
}

extension UIViewController {
  static func identifier() -> String {
    String(describing: self)
  }
  static func getVC(storyboardName: String) -> UIViewController {
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
    let controller = storyboard.instantiateViewController(withIdentifier: identifier()) 
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
}

//public class ControllerFactory {
//  
//  func getVC<T: UIViewController>(storyboardName: String) -> T {
//    let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
//    guard let controller = storyboard.instantiateViewController(withIdentifier: T.identifier()) as? T else {return T()}
//    
//    return controller
//  }
//  //MARK: - Main Controller
//  class func splashViewController() -> SplashViewController {
//    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "splashViewController") as! SplashViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func tabBarViewController() -> TabBarViewController {
//    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "tabBarViewController") as! TabBarViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func pdfViewController() -> PDFViewController {
//    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "pdfViewController") as! PDFViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  
//  //MARK: - Authantification Conrtollers
//  
//  class func roleController() -> RoleViewController {
//    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "roleController") as! RoleViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func numberController() -> NumberViewController {
//    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "numberController") as! NumberViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func confirmController() -> ConfirmationViewController {
//    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "confirmController") as! ConfirmationViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func registrationController() -> RegistrationViewController {
//    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "registrationController") as! RegistrationViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func doneController() -> DoneRegistrationViewController {
//    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "doneController") as! DoneRegistrationViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  
//  //MARK: -  News Controllers
//  
//  class func newsController() -> NewsViewController {
//    let storyBoard = UIStoryboard(name: "News", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "newsController") as! NewsViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func detailNewsController() -> DetailViewController {
//    let storyBoard = UIStoryboard(name: "News", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "detailNewsController") as! DetailViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func filteredViewController() -> FilteredViewController {
//    let storyBoard = UIStoryboard(name: "News", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "filteredViewController") as! FilteredViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func detailFilterTableViewController() -> DetailFilterTableViewController {
//    let storyBoard = UIStoryboard(name: "News", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "detailFilterTableViewController") as! DetailFilterTableViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  
//  //MARK: - Competition Controllers
//  
//  class func competitionController() -> CompetitionViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "competitionController") as! CompetitionViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func detailCompetitionConrtoller() -> DetailCompetitionViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "detailCompetitionConrtoller") as! DetailCompetitionViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func reglamentController() -> ReglamentViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "reglamentController") as! ReglamentViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func teamController() -> TeamViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "teamController") as! TeamViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func gridController() -> GridViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "gridController") as! GridViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func membersController() -> MembersViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "membersController") as! MembersViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func resultController() -> ResultsViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "resultController") as! ResultsViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func detailFilterCompTableViewController() -> DetailFilterCompTableViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "detailFilterCompTableViewController") as! DetailFilterCompTableViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func filteredCompViewController() -> FilteredCompViewController {
//    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "filteredCompViewController") as! FilteredCompViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  //MARK: - Profile controllers
//  class func judgeProfileViewController() -> JudgeProfileViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "judgeProfileViewController") as! JudgeProfileViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func compJudgeViewController() -> CompJudgeViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "compJudgeViewController") as! CompJudgeViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func categoryJudgeViewController() -> CategoryJudgeViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "categoryJudgeViewController") as! CategoryJudgeViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func startJudgeViewController() -> StartJudgeViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "startJudgeViewController") as! StartJudgeViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func trainerMainProfileViewController() -> TrainerMainProfileViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "trainerMainProfileViewController") as! TrainerMainProfileViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func dataTrainerViewController() -> DataTrainerViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "dataTrainerViewController") as! DataTrainerViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func competitionTrainerViewController() -> CompetitionTrainerViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "competitionTrainerViewController") as! CompetitionTrainerViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func sportsmenTrainerViewController() -> SportsmenTrainerViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "sportsmenTrainerViewController") as! SportsmenTrainerViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func requestViewController() -> RequestViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "requestViewController") as! RequestViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func categoryRequestViewController() -> CategoryRequestViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "categoryRequestViewController") as! CategoryRequestViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//  class func sportsmenRequestViewController() -> SportsmenRequestViewController {
//    let storyBoard = UIStoryboard(name: "Profile", bundle: nil)
//    let controller = storyBoard.instantiateViewController(withIdentifier: "sportsmenRequestViewController") as! SportsmenRequestViewController
//    controller.modalPresentationStyle = .overFullScreen
//    return controller
//  }
//}
