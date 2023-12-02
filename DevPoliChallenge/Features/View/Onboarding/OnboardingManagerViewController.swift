//
//  OnboardingViewController.swift
//  DevPoliChallenge
//
//  Created by mateusdias on 26/11/23.
//  Copyright © 2023 DevPoli. All rights reserved.
//

import UIKit

class OnboardingManagerViewController: UIPageViewController {
    
    var page: Int = 0
    
    private lazy var orderedViewControllers: [UIViewController] = {
        let firstOnboardingViewController = FirstOnboardingViewController()
        let secondOnboardingViewController = SecondOnboardingViewController()
        let thirdOnboardingViewController = ThirdOnboardingViewController()
        return[
            firstOnboardingViewController,
            secondOnboardingViewController,
            thirdOnboardingViewController
        ]
    }()
    
    private lazy var buttonSkip: UIButton = {
       let button = UIButton()
        button.setTitle("pular", for: .normal)
        button.setTitleColor(DesignSystem.Colors.background, for: .normal )
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToWelcomeView), for: .touchUpInside)
        return button
    }()
    
    private lazy var nextButtonAction: UIButton = {
        let button = UIButton()
        if let image = UIImage(named: "nextButton") {
            button.setImage(image, for: .normal)
        }
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 22
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var startButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = DesignSystem.Colors.accent
        button.layer.cornerRadius = 22
        button.setTitle("COMEÇAR", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(goToWelcomeView), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        
        addSubViews()
        
        nextButtonContraints()
        buttonSkipContraints()
        startButtonConstraints()
        setViewControllers([orderedViewControllers[page]], direction: .forward, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("salvador user defauults")
        UserDefaults.setFirstAccess(value: true)
    }
    

    
    func addSubViews(){

        view.addSubview(nextButtonAction)
        view.addSubview(startButton)
        view.addSubview(buttonSkip)
        
    }
    
    @objc func goToWelcomeView(_ sender:UIButton){
        let welcomeViewController = WelcomeViewController()
        navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    @objc func nextTapped(_ sender: UIButton){
        guard let currentPage = viewControllers?[0] else {return}
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else {return}
        self.page += 1
        elementsWillHidden(self.page)
        setViewControllers([nextPage], direction: .forward, animated: true, completion: nil)
    }
    
    //Constraints
        
    private func buttonSkipContraints(){
       NSLayoutConstraint.activate([
        buttonSkip.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 32),
        buttonSkip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -23)
       ])
    }

    
    private func nextButtonContraints(){
        NSLayoutConstraint.activate([
            nextButtonAction.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            nextButtonAction.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            nextButtonAction.widthAnchor.constraint(equalToConstant: 44),
            nextButtonAction.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func startButtonConstraints(){
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -26),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            startButton.widthAnchor.constraint(equalToConstant: 167),
            startButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func elementsWillHidden(_ page: Int){
        if page == 1 {
            buttonSkip.setTitleColor(DesignSystem.Colors.primary, for: .normal)
            startButton.isHidden = true
            buttonSkip.isHidden = false
            nextButtonAction.isHidden = false
        } else if page == 2 {
            buttonSkip.isHidden = true
            nextButtonAction.isHidden = true
            startButton.isHidden = false
        } else {
            buttonSkip.setTitleColor(DesignSystem.Colors.background, for: .normal)
            buttonSkip.isHidden = false
            nextButtonAction.isHidden = false
            startButton.isHidden = true
        }
    }

    
}



extension OnboardingManagerViewController: UIPageViewControllerDataSource {
    
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}

        if currentIndex != 0 {
            return orderedViewControllers[currentIndex - 1]
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = orderedViewControllers.firstIndex(of: viewController) else {return nil}
        
                
        if currentIndex < orderedViewControllers.count - 1 {
            
            return orderedViewControllers[currentIndex + 1]
        }
        
        return nil
    }
    
}

extension OnboardingManagerViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = viewControllers else { return }
        self.page = orderedViewControllers.firstIndex(of: viewControllers[0]) ?? 0
        elementsWillHidden(self.page)
        print(self.page)
 
    }

 
    
}
