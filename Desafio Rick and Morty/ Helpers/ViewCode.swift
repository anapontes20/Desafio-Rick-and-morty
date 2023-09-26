//
//  ViewCode.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 26/09/23.
//

import Foundation

protocol ViewCode {
    func setupHierarchy()
    func setupConstraints()
    func setupConfigurations()
}

extension ViewCode {
    func setupView(){
     setupHierarchy()
     setupConstraints()
     setupConfigurations()
}
    
    func setupConfigurations() {
        
    }
}
