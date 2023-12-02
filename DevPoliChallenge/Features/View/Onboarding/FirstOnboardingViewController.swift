//
//  ViewController.swift
//  DevPoliChallenge
//
//  Created by DevPoli on 29/07/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class FirstOnboardingViewController: UIViewController {
    
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
        image.image = UIImage(named: "imagem1")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Explore uma nova forma de organizar sua vida."
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelContent: UILabel = {
        let label = UILabel()
        label.text = "Descubra como nosso aplicativo pode ajudar você a planejar, acompanhar e concluir suas tarefas de maneira mais eficiente. Prepare-se para uma experiência incrível de produtividade!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        addSubViews()
        super.viewDidLoad()
        view.backgroundColor = DesignSystem.Colors.primary
        addSubViews()
        setupConstraints()

    }

    
    private func addSubViews() {
        
        view.addSubview(subView)
        view.addSubview(imageView)
    
        subView.addSubview(labelTitle)
        subView.addSubview(labelContent)
        subView.addSubview(subViewButton)
        
        subViewButton.addSubview(subStackView)

        subStackView.addArrangedSubview(seletedButton)
        subStackView.addArrangedSubview(diselectedButton1)
        subStackView.addArrangedSubview(diselectedButton2)
        
        
    }
    
    // CONSTRAINTS
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 117),
            imageView.bottomAnchor.constraint(equalTo: subView.topAnchor, constant: -76),
            imageView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 71),
            imageView.trailingAnchor.constraint(greaterThanOrEqualTo: view.trailingAnchor, constant: 71),
            imageView.widthAnchor.constraint(lessThanOrEqualToConstant:  248),
            
            subView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            subView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            subView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            subView.heightAnchor.constraint(equalToConstant: 318),
        
            labelTitle.topAnchor.constraint(equalTo: subView.topAnchor, constant: 22),
            labelTitle.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 22),
            labelTitle.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -22),
            labelTitle.heightAnchor.constraint(equalToConstant: 53),
            
            labelContent.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 5),
            labelContent.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 22),
            labelContent.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: -22),
            labelContent.heightAnchor.constraint(equalToConstant: 77),
            
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

