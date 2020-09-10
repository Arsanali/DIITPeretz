//
//  SecondViewController.swift
//  DIITPeretz
//
//  Created by arsik on 04.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
        

    var presenter: MainPresenter?
    var model: ProductModel?
    
  override func viewDidLoad() {
      super.viewDidLoad()
     tableView.delegate = self
     tableView.dataSource = self
     self.tableView.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1)
     presenter = MainPresenter(view: self)
     presenter?.requestData()
    }
    

    
}


extension SecondViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model?.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProductCell,
        let productModel = presenter?.model?[indexPath.row] else {
            return UITableViewCell()
    }
    
    cell.setup(with: productModel)
    return cell

  }
  
}

extension SecondViewController: MainView {
  func successData() {
    DispatchQueue.main.async {
      self.tableView.reloadData()
    }
  }
  
  func errorData(error: Error) {
    print("Данные не загрузились")
  }
}

extension SecondViewController: UITableViewDelegate {
  
}
