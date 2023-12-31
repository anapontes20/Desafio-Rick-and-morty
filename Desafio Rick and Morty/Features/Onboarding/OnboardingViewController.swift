//
//  OnboardingViewController.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 26/09/23.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var customView: OnboardingView = {
        let view = OnboardingView(delegate: self)
        return view
    }()

    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension OnboardingViewController: OnboardingViewDelegate {
    func onSeeCharactersDidTap() {
        let viewController = HomeViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    
}
