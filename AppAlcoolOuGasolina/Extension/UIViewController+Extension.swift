//
//  UIViewController+Extension.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 16/03/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    
    func hideKeyBoardWhenTappedAround(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
    }
    
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}
