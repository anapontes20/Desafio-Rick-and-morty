//
//  CharacterProfile.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 29/09/23.
//

import UIKit

class CharacterProfileViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    private lazy var characterProfile: CharacterProfileView = {
        let view = CharacterProfileView()
        return view
    }()
    
    override func loadView() {
        self.view = characterProfile
        
    }
}
