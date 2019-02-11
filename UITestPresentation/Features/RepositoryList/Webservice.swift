//
//  Webservice.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 07/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import Foundation

protocol WebserviceProtocol: AnyObject {
  func request(completion: @escaping (_: Result<Data, AppError>) -> Void)
}

class Webservice: WebserviceProtocol {

  func request(completion: @escaping (Result<Data, AppError>) -> Void) {
    guard let url = URL(string: "https://api.github.com/search/repositories?q=language:Swift&page=2&per_page=30") else {
      return completion(.error(.default))
    }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else {
        return completion(.error(.default))
      }

      guard let responseData = data else {
        return completion(.error(.default))
      }

      completion(.success(responseData))
      }.resume()
  }
}

enum Result<T, E: Error> {
  case success(T)
  case error(E)
}

enum AppError: Error {
  case `default`
}
