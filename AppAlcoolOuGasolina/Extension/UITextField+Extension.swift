//
//  UITextField+Extension.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 16/03/23.
//

import Foundation
import UIKit

extension UITextField {
    
    func addDoneBtnOnKeyBoard() {
        let doneToobar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToobar.barStyle = .default
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Ok", style: .done, target: self, action: #selector(doneBtnAction))
        
        let items = [flexSpace, done]
        doneToobar.items = items
        doneToobar.sizeToFit()
        self.inputAccessoryView = doneToobar
    }
    
    @objc func doneBtnAction() {
        self.resignFirstResponder()
    }
    
    
}
