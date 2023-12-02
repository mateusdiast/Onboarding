//
//  WelcomeViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 25/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//


import UIKit


class WelcomeViewController: UIViewController {
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.text = "Organize sua\nvida com facilidade e\neficiência."
        label.font = UIFont.boldSystemFont(ofSize: 42)
        label.numberOfLines = 4
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelContent: UILabel = {
        let label = UILabel()
        label.text = "Antes de começar a aproveitar todos os benefícios do nosso aplicativo, faça login ou crie uma conta para desbloquear todas as funcionalidades e otimizar sua rotina diária."
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 4
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var createAccountButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 22
        button.setTitle("CRIAR CONTA", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.layer.borderWidth = 2
        button.layer.borderColor = DesignSystem.Colors.accent.cgColor
        button.setTitleColor(DesignSystem.Colors.accent, for: .normal)
        button.layer.cornerRadius = 22
        button.setTitle("ENTRAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor =  DesignSystem.Colors.background
        navigationController?.isNavigationBarHidden = true
        addSubView()
        setupConstraints()
    }
    
    private func addSubView(){
        view.addSubview(labelTitle)
        view.addSubview(labelContent)
        view.addSubview(stackView)
        stackView.addArrangedSubview(createAccountButton)
        stackView.addArrangedSubview(signInButton)
    }
    
    // CONSTRAINTS
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            labelTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
            labelTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:  22),
            labelTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            labelTitle.heightAnchor.constraint(equalToConstant: 201),
            
            labelContent.topAnchor.constraint(equalTo: labelTitle.bottomAnchor, constant: 22),
            labelContent.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant:  22),
            labelContent.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            labelContent.heightAnchor.constraint(equalToConstant: 77),
            
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -67),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 71),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -71),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            createAccountButton.heightAnchor.constraint(equalToConstant: 44),
            
            signInButton.heightAnchor.constraint(equalToConstant: 44)
            
        ])
    }
    
}
