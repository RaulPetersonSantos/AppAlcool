//
//  Alert.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 01/03/23.
//

import UIKit

class Alert {

    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func showAlertInformation(title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okBtn = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(okBtn)
        
        controller.present(alertController, animated: true)
        
    }
    
}
