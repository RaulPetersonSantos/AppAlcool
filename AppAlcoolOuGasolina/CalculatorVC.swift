//
//  CalculatorVC.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 28/02/23.
//

import UIKit

class CalculatorVC: UIViewController {

    
    var screen: CalculatorView?
    var alert: Alert?

    
    override func loadView() {
        screen = CalculatorView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyBoardWhenTappedAround()
        alert = Alert(controller: self)
        screen?.delegate(delegate: self)
    }
    
    func validateTextFields() -> Bool{
        guard let ethanolPrice = screen?.alcoolTextField.text else { return false }
        guard let gasPrice = screen?.gasolinaTextField.text else { return false }
        
        if ethanolPrice.isEmpty && gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valores do àlcool e da gasolina")
            return false
        } else if ethanolPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe os valor do Alcool")
            return false
        }   else if gasPrice.isEmpty {
            alert?.showAlertInformation(title: "Atenção!", message: "Informe o valor da gasolina")
            return false
        }
        
        return true
    }
    
}

extension CalculatorVC: CalculatorProtocol {
    func tappedCalculateBtn() {
        
        if validateTextFields() {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal

            let ethanolPrice: Double = (formatter.number(from: screen?.alcoolTextField.text ?? "0.0") as? Double) ?? 0.0
            let gasPrice: Double = (formatter.number(from: screen?.gasolinaTextField.text ?? "0.0") as? Double) ?? 0.0

            var vc: ResultVC?
            if ethanolPrice / gasPrice > 0.7 {
                vc = ResultVC(bestFuel: .gas)
            } else {
                vc = ResultVC(bestFuel: .ethanol)
                print("Melhor utilizar alchool")
            }
            navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
        }
    }
    
    func tappedBackBtn() {
        navigationController?.popViewController(animated: true)
    }
    
}
