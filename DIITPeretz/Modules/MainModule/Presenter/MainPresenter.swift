//
//  MainPresenter.swift
//  DIITPeretz
//
//  Created by arsik on 04.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation

//MARK: - MainView
protocol MainView: class, Alertable {
  func successData()
  func errorData(error: Error)
}

//MARK: - MainPresenter
protocol MainPresenterProtocol: class {
  func requestData()
}

class MainPresenter: MainPresenterProtocol {
  
  var model: [ProductModel]?
  var networkng: NetworkManager
  weak var view: MainView?
  
  init(view: MainView) {
    self.view = view
    self.networkng = Networking()
  }
  
  func requestData() {
    
    networkng.getData { [weak self] result in
      
      DispatchQueue.main.async {
        
        switch result {
          
        case .success(let value):
          self?.model = value
          self?.view?.successData()
         // self?.view?.showAlert(title: "Данные загрузились ", message: "Downloading finished successful")
          print((String(describing: value)))
          
        case .failure(let error):
            let cancelAction = AlertAction(title: "Cancel", style: .cancel, handler: nil)
            let reloadAction = AlertAction(title: "Reload", style: .default) { _ in
                self?.requestData()
            }
            
            let alertModel = AlertModel(title: "OSHIBKA",
                                        message: error.localizedDescription,
                                        buttons: [cancelAction, reloadAction])
            
            self?.view?.showAlert(alertModel)
        }
      }
    }
  }
}

