//
//  ControllerFactory.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 14/6/21.
//

import UIKit

public class ControllerFactory {
  
  //MARK: - Authantification Conrtollers
  
  class func roleController() -> RoleViewController {
    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "roleController") as! RoleViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func numberController() -> NumberViewController {
    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "numberController") as! NumberViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func confirmController() -> ConfirmationViewController {
    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "confirmController") as! ConfirmationViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func registrationController() -> RegistrationViewController {
    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "registrationController") as! RegistrationViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func doneController() -> DoneRegistrationViewController {
    let storyBoard = UIStoryboard(name: "Auth", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "doneController") as! DoneRegistrationViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  
  //MARK: -  News Controllers
  
  class func newsController() -> NewsViewController {
    let storyBoard = UIStoryboard(name: "News", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "newsController") as! NewsViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func detailNewsController() -> DetailViewController {
    let storyBoard = UIStoryboard(name: "News", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "detailNewsController") as! DetailViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  
  //MARK: - Competition Controllers
  
  class func competitionController() -> CompetitionViewController {
    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "competitionController") as! CompetitionViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
  class func detailCompetitionConrtoller() -> DetailCompetitionViewController {
    let storyBoard = UIStoryboard(name: "Competition", bundle: nil)
    let controller = storyBoard.instantiateViewController(withIdentifier: "detailCompetitionConrtoller") as! DetailCompetitionViewController
    controller.modalPresentationStyle = .overFullScreen
    return controller
  }
}
