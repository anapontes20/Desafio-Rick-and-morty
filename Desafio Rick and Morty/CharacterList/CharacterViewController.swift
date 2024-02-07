//
//  HomeViewController.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 28/09/23.
//

import UIKit

class CharacterViewController: UIViewController {
    
    var characterView =  CharacterView()
    var homeManager = HomeManager()
    var dados = [HomeModel]()
    var isLoading = false
    var currentPage = 1
    



    //MARK: - DID LOAD E VALIDACOES
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeManager.callApi(page: 1)
        let containerView = UIView()
        view = characterView
        homeManager.delegate = self
        self.characterView.tableView.delegate = self
        characterView.tableView.delegate = self
        characterView.tableView.dataSource = self
        loadData()
        characterView.delegate = self

    
        //MARK: - PERSONALIZACAO DE TECLA BACK, TITULO
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        
        let label = UILabel()
        label.text = "Character"
        label.font = .customFont(ofSize: 50, weight: .bold )
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let searchBar = UISearchBar()
        searchBar.placeholder = "Pesquisar"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(label)
        containerView.addSubview(searchBar)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: containerView.topAnchor),
            label.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            
            searchBar.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            searchBar.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
       
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)
        navigationItem.backBarButtonItem?.tintColor = UIColor.Others.color7
        
    }
    
    func loadData() {
          guard !isLoading else {
              return
          }

          isLoading = true
          homeManager.callApi(page: currentPage) 
          currentPage += 1
      }
}

//MARK: - DELEGATE DOS DADOS:

extension CharacterViewController: HomeManagerDelegate {
    func didUpdateProfile(_ _HomeManager: HomeManager, homeModel: HomeModel) {
        print(homeModel)
    }
    
    func didUpdateHome(_ _HomeManager: HomeManager, homeModel: [HomeModel]) {
        isLoading = false

              if homeModel.isEmpty {
                  return
              }

              dados.append(contentsOf: homeModel)

              DispatchQueue.main.async {
                  self.characterView.tableView.reloadData()
        }

    }
}

extension CharacterViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = CharacterCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? CharacterCell else {
            return UITableViewCell()
        }
        let nome = dados[indexPath.row].nome
        cell.characterName.text = nome
        
        let status = dados[indexPath.row].status
        cell.statusLabel.text = status
        
        let location = dados[indexPath.row].localizacaonome
        cell.locationLabel.text = location
        
        if let urlString = dados[indexPath.row].imagem as? String {
            if let imageURL = URL(string: urlString) {
                DispatchQueue.global().async {
                    guard let imageData = try? Data(contentsOf: imageURL) else { return }
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        // Anotação de tipo explícita para a propriedade image
                        // Certifique-se de que posterPersonagem.image seja do tipo UIImageView
                        cell.characterImage.image = image
                        
                    }
                }
            }
        }
        
        let lastIndex = dados.count - 1
             if indexPath.row == lastIndex {
                 loadData()
             }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCharacter = dados[indexPath.row]
        let idDoPersonagem = selectedCharacter.id
        //print(idDoPersonagem)
        homeManager.callApiId(id: idDoPersonagem) { result in
            switch result {
            case .success(let profile):
                self.onSeeCharactersDidTap(profile: profile)

                
            case .failure(let error):
                print(error)
            }
        }



    
    }
    
}

//MARK: - MUDAR DE TELA:

extension CharacterViewController: CharacterViewDelegate {
    func onSeeCharactersDidTap(profile: HomeModel) {
        let viewController = CharacterProfileViewController()
        viewController.profile = profile

        navigationController?.pushViewController(viewController, animated: true)
    }
}
