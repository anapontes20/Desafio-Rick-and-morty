//
//  HomeCell.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

//MARK: - CELLS

class CharacterCell: UITableViewCell {
    
    static let identifier = String(describing: CharacterCell.self)
    
    private lazy var cardBase: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var locationDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .customFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    private lazy var vStackView: UIStackView = {
        let stackView = UIStackView([characterName,statusLabel,locationDescriptionLabel,locationLabel],
                                    axis: .vertical,
                                    distribution: .fill,
                                    alignment: .fill,
                                    spacing: 8
        )
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell(data:Character) {
        characterImage.image = UIImage(named: data.image)
        characterName.text = data.name
        statusLabel.text = data.status
        locationDescriptionLabel.text = data.descriptionLocation
        locationLabel.text =  data.location
    }
    
}

//MARK: - HOMECELL 

extension CharacterCell: ViewCode {
    func setupHierarchy() {
        addSubview(cardBase)
        cardBase.addSubview(characterImage)
        cardBase.addSubview(vStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardBase.topAnchor.constraint(equalTo: topAnchor),
            cardBase.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardBase.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardBase.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            cardBase.heightAnchor.constraint(equalToConstant: 120),
            
            characterImage.topAnchor.constraint(equalTo: topAnchor),
            characterImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 120),
            characterImage.heightAnchor.constraint(equalToConstant: 120),
            
            vStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            vStackView.leadingAnchor.constraint(equalTo: characterImage.trailingAnchor, constant: 8),
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
    
    func setupConfigurations() {
        backgroundColor = .clear
        cardBase.layer.cornerRadius = 10
        cardBase.layer.borderColor = UIColor.Grays.color1.cgColor
        cardBase.layer.borderWidth = 3
        
    }
    
    
}
