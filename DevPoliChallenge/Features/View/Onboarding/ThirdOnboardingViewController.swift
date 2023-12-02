//
//  Onboarding3ViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 25/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//


import UIKit

class ThirdOnboardingViewController: UIViewController {

    private lazy var subViewButton: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var subStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var containerImage: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    

    
    private lazy var seletedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var diselectedButton1: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.accent
        button.alpha = 0.5
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var diselectedButton2: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.accent
        button.alpha = 0.5
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var subView: UIView = {
        let view = UIView()
        view.backgroundColor = DesignSystem.Colors.backgroundSubView
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imagem3")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Conquiste mais, se preocupe\nmenos."
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelContent: UILabel = {
        let label = UILabel()
        label.text = "Com o nosso app, suas tarefas viram conquistas. Acompanhe seu progresso, marque itens concluídos e sinta a satisfação de ver suas metas se tornarem realidade. Este é o começo de uma jornada mais produtiva e realizadora!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 6
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.accent
        addSubViews()
        setupConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }

    
    private func addSubViews() {
        
        view.addSubview(subView)
        view.addSubview(containerImage)
      
        containerImage.addSubview(imageView)
    
        subView.addSubview(labelTitle)
        subView.addSubview(labelContent)
        subView.addSubview(subViewButton)
        
        subViewButton.addSubview(subStackView)

        subStackView.addArrangedSubview(diselectedButton1)
        subStackView.addArrangedSubview(diselectedButton2)
        subStackView.addArrangedSubview(seletedButton)
        
        
    }
    
    // CONSTRAINTS
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            containerImage.topAnchor.constraint(equalTo: view.topAnchor),
            containerImage.bottomAnchor.constraint(equalTo: subView.topAnchor),
            containerImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: containerImage.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: containerImage.centerYAnchor),
            imageView.widthAnchor.constraint(equalTo: containerImage.widthAnchor, multiplier: 1.0),
            
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            subView.topAnchor.constraint(equalTo: containerImage.bottomAnchor),
            subView.heightAnchor.constraint(equalToConstant: 318),
            
            labelTitle.topAnchor.constraint(equalTo: subView.topAnchor, constant: 22),
            labelTitle.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 22),
            labelTitle.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -22),
            labelTitle.heightAnchor.constraint(equalToConstant: 53),
            
            labelContent.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            labelContent.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 22),
            labelContent.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -22),
            labelContent.heightAnchor.constraint(equalToConstant: 115),
            
            subViewButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -26),
            subViewButton.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 22),
            subViewButton.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -22),
            subViewButton.heightAnchor.constraint(equalToConstant: 44),
            
            subStackView.widthAnchor.constraint(equalToConstant: 77),
            subStackView.heightAnchor.constraint(equalToConstant: 12),
            subStackView.centerYAnchor.constraint(equalTo: subViewButton.centerYAnchor),
            
            seletedButton.widthAnchor.constraint(equalToConstant: 37),
            
            diselectedButton1.widthAnchor.constraint(equalToConstant: 12),
            diselectedButton2.widthAnchor.constraint(equalToConstant: 12)
        
        ])
    }

}



