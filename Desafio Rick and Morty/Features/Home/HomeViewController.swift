//
//  HomeViewController.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var homeCustom: HomeView = {
        let view = HomeView()
        return view
    }()
    
    override func loadView() {
        self.view = homeCustom
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    
}

