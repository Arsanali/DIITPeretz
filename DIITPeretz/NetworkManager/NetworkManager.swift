//
//  NetworkManeger.swift
//  DIITPeretz
//
//  Created by arsik on 05.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation
import Alamofire 

protocol NetworkManager {
  func getData(completion: @escaping(Result<[ProductModel], Error>)->())
}


class Networking: NetworkManager {
    
  func getData(completion: @escaping (Result<[ProductModel], Error>) -> ()) {
    let urlString = "https://peretz-group.ru/api/v2/products?category=93&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
    
    guard let url = URL(string: urlString) else { return }

    AF.request(url, method: .get).response {(responseData) in
        
        if let error = responseData.error {
            completion(.failure(error))
            return
        }
      
      guard let data = responseData.data else { return }
      
      do {
        let productData = try JSONDecoder().decode([ProductModel].self, from:data )
        
        completion(.success(productData))
        
        print(productData)
      } catch (let error) {
        
        completion(.failure(error))
        
        print("error \(error.localizedDescription)")
        }
      }
    }
}

  
