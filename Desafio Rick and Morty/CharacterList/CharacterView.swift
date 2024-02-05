//
//  HomeView.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

protocol CharacterViewDelegate: AnyObject {
    func onSeeCharactersDidTap(profile: HomeModel)
}

class CharacterView: UIView {
    
    var celula = CharacterCell()
            
    //MARK: - TABLEVIEW:
    
     var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    weak var delegate: CharacterViewDelegate?
    
    //MARK: - INIT
    init() {
        super.init(frame: .zero)
        setupView()
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - EXTENSION:

extension CharacterView: ViewCode {
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 130),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),
        ])
    }
    
    func setupConfigurations() {
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
        backgroundColor = .white
        tableView.layer.masksToBounds = false
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowOffset = CGSize(width: 5, height: 5)
        tableView.layer.shadowRadius = 10
        
    }
}


