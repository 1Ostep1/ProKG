//
//  SignInInfo.swift
//  ProKG
//
//  Created by Рамазан Юсупов on 5/22/21.
//

import Foundation

struct TokenInfo: Codable {
  let token: String
}
struct SignInfo: Codable {
    let email: String
    let password: String
}
