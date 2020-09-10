//
//  AlertModel.swift
//  DIITPeretz
//
//  Created by arsik on 09.09.2020.
//  Copyright © 2020 arsik. All rights reserved.
//

import UIKit

struct AlertAction {
    let title: String
    let style: UIAlertAction.Style
    let handler: ((UIAlertAction) -> Void)?
}

struct AlertModel {
    let title: String
    let message: String
    let buttons: [AlertAction]
}
