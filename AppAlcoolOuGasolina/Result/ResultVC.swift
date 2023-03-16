//
//  ResultVC.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 15/03/23.
//

import UIKit


enum BestFuel: String {
    
    case gas = "Gasolina"
    case ethanol = "Álcool"
}

class ResultVC: UIViewController {

    var screen: ResultView?
    
    let bestFuel: BestFuel
    
    init(bestFuel: BestFuel){
        self.bestFuel = bestFuel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder:NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        screen = ResultView()
        view = screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
        screen?.resultLbl.text = bestFuel.rawValue
    }
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    

}


extension ResultVC: ResultProtocol {
    func tappedBackBtn() {
        popViewController()
    }
    
    func tappedCalculateBtn() {
        popViewController()
    }
    
    
    
}
