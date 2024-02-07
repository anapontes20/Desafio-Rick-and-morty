//
//  CharacterProfileView.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 29/09/23.
//

import UIKit

class CharacterProfileView: UIView {
    
    //MARK: - UISCROLLVIEW:
    
     lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.showsVerticalScrollIndicator = true
        view.isDirectionalLockEnabled = true
        return view
    }()
    
    
    //MARK: - CONTENTVIEW:
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //MARK: - CIRCLE VIEW:
    
     lazy var circleView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 6
        view.layer.borderWidth = 1
        view.clipsToBounds = false
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: - UIIMAGE:
     lazy var imageCharacter: UIImageView = {
        let image = UIImageView(image: .antennaRick)
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //MARK: - UILABEL:
    
     lazy var titleCharacter: UILabel = {
        let label = UILabel()
        label.text = "Antenna Morty"
        label.font = .customFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - STATUS CHARACTER:
    
     lazy var statusCharacter: UILabel = {
        let label = UILabel()
        label.text = "Alive"
        label.font = .customFont(ofSize: 20, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    //MARK: -  ABOUT LABEL:
     
     lazy var aboutLabel: UILabel = {
       let label = UILabel()
        label.text = "About"
        label.font = .customFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - SPECIES CHARACTER:
    
     lazy var speciesCharacter: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Specie: Human"
        label.textColor = .Others.color7
        label.font = .customFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    //MARK: - ORIGIN CHARACTER:
    
     lazy var originCharacter: UILabel = {
        let label = UILabel()
        label.text = "Origin: Earth"
        label.textColor = .Others.color7
        label.font = .customFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - LOCATION CHARACTER:
    
     lazy var locationCharacter: UILabel = {
       let label = UILabel()
        label.text = "Location: Citadel of Ricks"
        label.textColor = .Others.color7
        label.font = .customFont(ofSize: 15, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()
    
    //MARK: - SIMBOL ESPECIE:
    
     lazy var simbolSpecie: UIImageView = {
        let image = UIImageView(image: .dna)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: - HSTACK:
    
     lazy var hStacView: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [circleView, statusCharacter])
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.spacing = 12
        hStack.backgroundColor = .white
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()

   
    //MARK: - HSTACK:
    
     lazy var hStacViewDescription: UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [aboutLabel,speciesCharacter,originCharacter,locationCharacter])
        hStack.axis = .vertical
        hStack.alignment = .leading
        hStack.distribution = .fillProportionally
        hStack.spacing = 5
        hStack.backgroundColor = .white
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
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

//MARK: - EXTENSIONS:

extension CharacterProfileView: ViewCode {
    func setupHierarchy() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        addSubview(imageCharacter)
        addSubview(titleCharacter)
        addSubview(hStacView)
        addSubview(hStacViewDescription)

//        addSubview(statusCharacter)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor, multiplier: 2),

            imageCharacter.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageCharacter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageCharacter.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageCharacter.heightAnchor.constraint(equalToConstant: 300),
            
            titleCharacter.topAnchor.constraint(equalTo: imageCharacter.bottomAnchor, constant: 10),
            titleCharacter.leadingAnchor.constraint(equalTo: imageCharacter.leadingAnchor, constant: 16),
            titleCharacter.trailingAnchor.constraint(equalTo: imageCharacter.trailingAnchor),

            hStacView.topAnchor.constraint(equalTo: titleCharacter.bottomAnchor,constant: 16),
            hStacView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            hStacView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            hStacViewDescription.topAnchor.constraint(equalTo: hStacView.bottomAnchor,constant: 16),
            hStacViewDescription.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            hStacViewDescription.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            
            circleView.heightAnchor.constraint(equalToConstant: 12),
            circleView.widthAnchor.constraint(equalToConstant: 12),
            
//            simbolSpecie.heightAnchor.constraint(equalToConstant: 5),
//            simbolSpecie.widthAnchor.constraint(equalToConstant: 5),

            
        ])
        
    }
    
    
    
}
