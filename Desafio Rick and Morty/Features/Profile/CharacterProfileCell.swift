//
//  CharacterProfileCell.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 02/10/23.
//

import UIKit

class CharacterProfileCell: UITableViewCell {
    
    static let identifier = String(describing: CharacterProfileCell.self)

    //MARK: - CELLS:
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 16, weight: .bold)
        label.text = "teste"
        return label
    }()

    
    // MARK: - INIT:
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

extension CharacterProfileCell: ViewCode {
    func setupHierarchy() {
        addSubview(characterName)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            characterName.topAnchor.constraint(equalTo: topAnchor),
            characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            characterName.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
}
