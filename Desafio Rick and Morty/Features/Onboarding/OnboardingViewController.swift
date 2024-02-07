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
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.Others.color7
    }

}

extension OnboardingViewController: OnboardingViewDelegate {
    func onSeeCharactersDidTap() {
        let viewController = CharacterViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
