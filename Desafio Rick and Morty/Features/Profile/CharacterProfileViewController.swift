//
//  CharacterProfile.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 29/09/23.
//

import UIKit

class CharacterProfileViewController: UIViewController {

   // var character = [HomeModel]()
    var profile: HomeModel?
    //var perfil = CharacterProfileView()
    //var characterID: Int?
    //var homeManager = HomeManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
      //  view.backgroundColor = .white
    }
    
    private lazy var characterProfile: CharacterProfileView = {
        let view = CharacterProfileView()
        return view
    }()
    
    override func loadView() {
        self.view = characterProfile
        
    }
    func bindProfile(profile:HomeModel) t {
  
}

//extension CharacterProfileViewController: ProfileManagerDelegate {
//    func didUpdateProfile(_ _profileManager: ProfileManager, profile: HomeModel) {
//        perfil.titleCharacter.text = profile.nome
//    }
//    
//    
//}


