//
//  ServerManager.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/22/21.
//

import Foundation
import Alamofire

class ServerManager: HTTPRequest {
  class var shared: ServerManager {
    struct Static {
      static let instanse = ServerManager()
    }
    return Static.instanse
  }
}

extension ServerManager {
  func signInPost(signIn: SignInfo, complition: @escaping (TokenInfo) -> () , error: @escaping (String) -> ()) {
    let headers = ["Content-Type": "application/json"]
    let parametrs: [String: Any] = [
      "email": signIn.email,
      "password": signIn.password
    ]
    post(url: "", parameters: parametrs, header: headers) { (data) in
      guard let data = data else {return}
      do {
        let convertedData = try JSONDecoder().decode(TokenInfo.self, from: data)
        complition(convertedData)
      } catch let er {
        print(er.localizedDescription)
      }
    } error: { (error) in
      print(error)
    }
  }
  func getNews(token: String, complition: @escaping ([NewsModel]) -> () , error: @escaping (String) -> ()) {
    let headers = ["Authorization": "Bearer \(token)"]
    get(url: "https://sportpro3.herokuapp.com/api/news/news/", header: headers) { (data) in
      guard let data = data else {return}
      do {
        let convertedData = try JSONDecoder().decode([NewsModel].self, from: data)
        complition(convertedData)
      } catch let er {
        print(er.localizedDescription)
      }
    } error: { (err) in
      print(err)
    }
  }
  func getEvents(token: String, complition: @escaping ([EventsModel]) -> () , error: @escaping (String) -> ()) {
    let headers = ["Authorization": "Bearer \(token)"]
    get(url: "", header: headers) { (data) in
      guard let data = data else {return}
      do {
        let convertedData = try JSONDecoder().decode([EventsModel].self, from: data)
        complition(convertedData)
      } catch let er {
        print(er.localizedDescription)
      }
    } error: { (err) in
      print(err)
    }
  }
}
