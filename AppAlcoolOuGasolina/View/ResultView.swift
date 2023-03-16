//
//  ResultView.swift
//  AppAlcoolOuGasolina
//
//  Created by raul.santos on 15/03/23.
//

import UIKit

protocol ResultProtocol: AnyObject {
    func tappedBackBtn()
    func tappedCalculateBtn()
}

class ResultView: UIView {
    
    private weak var delegate: ResultProtocol?
    
    public func delegate(delegate: ResultProtocol) {
        self.delegate = delegate
    }
    
    lazy var backgroundImgView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "BG BLUR")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var logoAppImgView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "LOGO menor")
        image.contentMode = .scaleAspectFit
        
        return image
    }()
    
    lazy var titlelbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 34)
        lbl.text =  "Abasteça com:"
        		
        return lbl
    }()
    
    lazy var resultLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .white
        lbl.font = UIFont.boldSystemFont(ofSize: 73)
        lbl.text =  "Gasolina"
                
        return lbl
    }()

    lazy var calculateBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calcular", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        btn.setTitleColor(.white, for: .normal)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 8
        btn.backgroundColor = UIColor(named: "PinkColor")
        btn.addTarget(self, action: #selector(tappedCalculateBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedCalculateBtn(){
        delegate?.tappedCalculateBtn()
    }
    
    lazy var backBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "Botão Back"), for: .normal)
        btn.addTarget(self, action: #selector(tappedCalculateBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func tappedBackBtn(){
        delegate?.tappedBackBtn()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(backgroundImgView)
        addSubview(logoAppImgView)
        addSubview(titlelbl)
        addSubview(resultLbl)
        addSubview(calculateBtn)
        addSubview(backBtn)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        
        
        NSLayoutConstraint.activate([
            backgroundImgView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImgView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImgView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImgView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backBtn.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            logoAppImgView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            logoAppImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            logoAppImgView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
           
            titlelbl.topAnchor.constraint(equalTo: logoAppImgView.bottomAnchor,constant: 180),
            titlelbl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            resultLbl.topAnchor.constraint(equalTo: titlelbl.bottomAnchor, constant: 12),
            resultLbl.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            calculateBtn.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -135),
            calculateBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60),
            calculateBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60),
            calculateBtn.heightAnchor.constraint(equalToConstant: 44)
        
        ])
        
        
    }
    
}
