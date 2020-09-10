//
//  ProductModel.swift
//  DIITPeretz
//
//  Created by arsik on 04.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation


struct ProductModel: Codable {
  let id: Int
  let name: String
  let description: String
  let price: Int
  let image: String
}

enum CodingKeys: String , CodingKey {
  case id = "id"
  case name = "name"
  case description = "description"
  case price = "price"
  case image = "image"
}
