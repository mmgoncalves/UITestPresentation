//
//  RepoModel.swift
//  UITestPresentation
//
//  Created by m.marques.goncalves on 07/02/19.
//  Copyright © 2019 Mateus Marques. All rights reserved.
//

import Foundation

struct Item: Codable {
  let items: [RepoModel]
}

struct RepoModel: Codable {
  let id: Int
  let name: String
  let stars: Int
  let forks: Int

  enum CodingKeys: String, CodingKey {
    case id
    case name
    case stars = "stargazers_count"
    case forks
  }
}
