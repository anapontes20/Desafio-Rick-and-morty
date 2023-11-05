//
//  HomeViewController.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

class CharacterViewController: UIViewController {
    
    
    //MARK: - SEARCHBAR E TITULO:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        let label = UILabel()
        label.text = "Character"
        label.font = .customFont(ofSize: 50, weight: .bold )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        containerView.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }
    
    private lazy var homeCustom: CharacterView = {
        let view = CharacterView()
        return view
    }()
    
    override func loadView() {
        self.view = homeCustom
        
    }
    
}

extension CharacterViewController: CharacterViewControllerDelegate {
    func onSeeCharactersDidTap() {
        let viewController = CharacterProfileViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
