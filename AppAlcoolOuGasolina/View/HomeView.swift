//
//  HomeView.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 28/02/23.
//

import UIKit

protocol HomeViewDelegate: AnyObject {
    func tappedStartButton()
    
}

class HomeView: UIView {
    
    private weak var delegate: HomeViewDelegate?
    
    public func delegate(delegate: HomeViewDelegate?) {
        self.delegate = delegate
    }
    

    lazy var background: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG HOME")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var logo: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.image = UIImage(named: "LOGO")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var startBtn: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Começar", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.backgroundColor = UIColor(named: "PinkColor")
        btn.addTarget(self, action: #selector(tappedButton), for: .touchUpInside)
        
        return btn
    }()
    
    
    @objc func tappedButton() {
        delegate?.tappedStartButton()
    }
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(background)
        addSubview(logo)
        addSubview(startBtn)
        setupUI()
     
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupUI(){
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: topAnchor),
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            
            startBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -125),
            startBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            startBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            startBtn.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
}
