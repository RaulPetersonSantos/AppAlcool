//
//  CalculatorView.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 28/02/23.
//

import UIKit

protocol CalculatorProtocol: AnyObject {
    
    func tappedCalculateBtn()
    func tappedBackBtn()
    
}

class CalculatorView: UIView {

    private weak var delegate: CalculatorProtocol?
    
    public func delegate(delegate: CalculatorProtocol?) {
        self.delegate = delegate
    }
    
    lazy var background: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    lazy var logoApp: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    
    lazy var alcoolTextField: UITextField = {
       let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .decimalPad
        txt.placeholder = "Preço do Àlcool"
        txt.textColor = .darkGray
        return txt
    }()
    
    lazy var gasolinaTextField: UITextField = {
       let txt = UITextField()
        txt.translatesAutoresizingMaskIntoConstraints = false
        txt.autocorrectionType = .no
        txt.backgroundColor = .white
        txt.borderStyle = .roundedRect
        txt.keyboardType = .decimalPad
        txt.placeholder = "Preço da Gasolina"
        txt.textColor = .darkGray
        return txt
    }()
    
    
    lazy var calculateBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calcular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.backgroundColor = .darkGray
        btn.addTarget(self, action: #selector(tappedCalculateBtn), for: .touchUpInside)
         
        return btn
    }()
    
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named:"Botão Back"), for: .normal)
        btn.addTarget(self, action: #selector(tappedBackBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedCalculateBtn() {
        delegate?.tappedCalculateBtn()
    }
    
    @objc func tappedBackBtn() {
        delegate?.tappedBackBtn()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        addSubview(logoApp)
        addSubview(alcoolTextField)
        addSubview(gasolinaTextField)
        addSubview(calculateBtn)
        addSubview(backBtn)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI() {
        
        NSLayoutConstraint.activate([
        
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
        
            logoApp.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            logoApp.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoApp.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            alcoolTextField.topAnchor.constraint(equalTo: logoApp.bottomAnchor, constant: 200),
            alcoolTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            alcoolTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            alcoolTextField.heightAnchor.constraint(equalToConstant: 40),
            
            gasolinaTextField.topAnchor.constraint(equalTo: alcoolTextField.bottomAnchor, constant: 16),
            gasolinaTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            gasolinaTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            gasolinaTextField.heightAnchor.constraint(equalToConstant: 40),
            
            calculateBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -130),
            calculateBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            calculateBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            calculateBtn.heightAnchor.constraint(equalToConstant: 44),
            
            
        ])
        
    }
    
    
    
}
