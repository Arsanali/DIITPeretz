//
//  ViewController.swift
//  DIITPeretz
//
//  Created by arsik on 04.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  @IBOutlet weak var getProductButton: UIButton!
    
  var presenter: MainPresenter?
 
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1)
    settingButton()
    navigationController?.navigationBar.barTintColor = UIColor(red: 0.14, green: 0.14, blue: 0.14, alpha: 1)
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    self.navigationItem.backBarButtonItem?.tintColor = .white
    
    presenter = MainPresenter(view: self)
    presenter?.requestData()

  }
  
  func settingButton(){
    getProductButton.backgroundColor = UIColor(red: 0, green: 0.647, blue: 0.169, alpha: 1)
    getProductButton.setTitle("Перейти к покупкам", for: .normal)
    getProductButton.tintColor = .white
    getProductButton.layer.cornerRadius = 4
  }
  
  
  @IBAction func getProductAction(_ sender: UIButton) {
    guard let vc = UIStoryboard(name: "SecondModule", bundle: nil).instantiateViewController(withIdentifier: "SecondModule") as? SecondViewController else { return }
    self.navigationController?.pushViewController(vc, animated: true)
    
  }
}

extension ViewController: MainView {
  func successData() {
    print("")
  }
  
  func errorData(error: Error) {
    print("")
  }
}
