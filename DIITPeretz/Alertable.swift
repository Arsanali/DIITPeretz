//
//  Alertable.swift
//  DIITPeretz
//
//  Created by arsik on 09.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

protocol Alertable {
    func showAlert(_ model: AlertModel)
    func showAlert(title: String, message: String)
}

extension Alertable where Self: UIViewController {
    
    func showAlert(_ model: AlertModel) {
        let alert = UIAlertController(title: model.title,
                                      message: model.message,
                                      preferredStyle: .alert)
        
        model.buttons.forEach {
            
            let handler = $0.handler
            
            let action = UIAlertAction(title: $0.title,
                                       style: $0.style,
                                       handler: handler)
            
            alert.addAction(action)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func showAlert(title: String, message: String) {
        
        let okAction = AlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
        
        let model = AlertModel(title: title,
                               message: message,
                               buttons: [okAction])
        
        showAlert(model)
    }
}
