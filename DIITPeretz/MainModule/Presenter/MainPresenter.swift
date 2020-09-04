//
//  MainPresenter.swift
//  DIITPeretz
//
//  Created by arsik on 04.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import Foundation
//MARK: - MainView
protocol MainViewPresenter: class {
  
}
//MARK: - MainPresenter
protocol MainPresenterProtocol: class {
  var view: MainViewPresenter { get }

}

class MainPresenter: MainPresenterProtocol {
  var view: MainViewPresenter
  
  init(view: MainViewPresenter) {
    self.view = view
  }
}

