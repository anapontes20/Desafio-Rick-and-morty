//
//  HomeView.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

protocol CharacterViewControllerDelegate: AnyObject {
    func onSeeCharactersDidTap()
}

class CharacterView: UIView {
            
    //MARK: - TABLEVIEW:
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    //MARK: - INIT
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterCell.self, forCellReuseIdentifier: CharacterCell.identifier)
        backgroundColor = .white
        tableView.layer.masksToBounds = false
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowOffset = CGSize(width: 5, height: 5)
        tableView.layer.shadowRadius = 10
        
    }
}

extension CharacterView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataCharacter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: dataCharacter[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Primeiro, obtenha a célula selecionada, se necessário
        if let cell = tableView.cellForRow(at: indexPath) {
            // Execute a navegação para a próxima tela (view controller)
            let novaTela = CharacterProfileViewController() // Substitua por seu próprio view controller
            self.navigationController?.pushViewController(novaTela, animated: true)
        }
    }
}
