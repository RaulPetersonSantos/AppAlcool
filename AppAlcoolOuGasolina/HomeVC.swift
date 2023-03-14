//
//  ViewController.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 28/02/23.
//

import UIKit

class HomeVC: UIViewController {
  
    var screen: HomeView?
    
    override func loadView() {
        screen = HomeView()
        view = screen
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        screen?.delegate(delegate: self)
    }
    

}

extension HomeVC: HomeViewDelegate {
    func tappedStartButton() {
        let vc = CalculatorVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

