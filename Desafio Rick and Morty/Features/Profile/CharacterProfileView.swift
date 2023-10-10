//
//  CharacterProfileView.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 29/09/23.
//

import UIKit

class CharacterProfileView:UIView {
        
    //MARK: - IMAGE PROFILE:
    
    private lazy var imageProfile: UIImageView = {
        let image = UIImageView(image: .logoImg)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    
    // MARK: - CHARACTER NAME:
    
    private lazy var characterName: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.text = "Rick"
        name.font = .customFont(ofSize: 30, weight: .bold)
        return name
    }()
    
    // MARK: - CHARACTER STATUS:
    
    private lazy var characterStatus: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.text = "Alive"
        status.font = .customFont(ofSize: 15, weight: .light)
        return status
    }()
    
    // MARK: - TABLEVIEW:

    private lazy var tableViewProfile: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    //MARK: - INIT:
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: - EXTENSION:

extension CharacterProfileView: ViewCode {
    func setupHierarchy() {
        addSubview(imageProfile)
        addSubview(characterName)
        addSubview(characterStatus)
        addSubview(tableViewProfile)
        tableViewProfile.register(CharacterProfileCell.self, forCellReuseIdentifier: CharacterProfileCell.identifier)

    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageProfile.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 100),
            imageProfile.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageProfile.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageProfile.widthAnchor.constraint(equalToConstant: 100),
            imageProfile.heightAnchor.constraint(equalToConstant: 100),
                    
            characterName.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 100),
            characterName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            characterName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            characterName.bottomAnchor.constraint(equalTo: characterStatus.topAnchor),
            
            characterStatus.topAnchor.constraint(equalTo: characterName.bottomAnchor, constant: 100),
            characterStatus.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            characterStatus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            characterStatus.bottomAnchor.constraint(equalTo: tableViewProfile.topAnchor),

            tableViewProfile.topAnchor.constraint(equalTo: characterStatus.bottomAnchor, constant: 100),
            tableViewProfile.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableViewProfile.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableViewProfile.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16),

        ])
    }
    
    func setupConfigurations() {
        tableViewProfile.delegate = self
        tableViewProfile.dataSource = self
    }
}

extension CharacterProfileView: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterProfileCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CharacterProfileCell else {

            return UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "About"
    }
}
