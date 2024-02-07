//
//  HomeManager.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 16/11/23.
//

import Foundation
import UIKit

protocol HomeManagerDelegate {
    func didUpdateHome(_ _HomeManager: HomeManager, homeModel: [HomeModel])
}

class HomeManager {
    var myUrl = "https://rickandmortyapi.com/api/character"
    var delegate: HomeManagerDelegate?
    var currentPage = 1
    var urlProfile = "https://rickandmortyapi.com/api/character/"

    //MARK: - CHAMADA API TABLE VIEW
    
    func callApi(page:Int) {
        if let url = URL(string: "\(myUrl)?page=\(page)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    //   print(error)
                }
                if let data = data {
                    //  print(data)
                    let home = self.parseJSON(data)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ homeData: Data) -> [HomeModel] {
        let decoder = JSONDecoder()
        do {
            let results = try! JSONDecoder().decode(RickAndMorty.self, from: homeData)
            print(results)
            var resultModel = [HomeModel]()
            
            for item in results.results {
                var episodeModel = [String]()
                for episodio in item.episode {
                    episodeModel.append(episodio)
                }
                let resultado = HomeModel( id: item.id,
                                           nome: item.name,
                                           status: item.status,
                                           especie: item.species,
                                           imagem: item.image,
                                           created: item.created,
                                           origemnome: item.origin.name,
                                           urlDaOrigem: item.origin.url,
                                           localizacaonome: item.location.name,
                                           urlDaLocalizacao: item.location.url)
                
                resultModel.append(resultado)
                
            }
            
            //print(home)
            self.delegate?.didUpdateHome(self, homeModel: resultModel)
            
            return resultModel
        }
        
    }
    func callApiId(id:Int, _ completion: @escaping(Result<HomeModel, Error>) -> Void) {
        if let url = URL(string: "\(urlProfile)\(id)") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    completion(.failure(error!))
                }
                if let data = data  {
                      print(data)
                    let home = self.parseJSONID(data)
                    completion(.success(home))
                }
            }
            task.resume()
        }
    }

    func parseJSONID(_ homeData: Data) -> HomeModel {
        //print(homeData)
        let decoder = JSONDecoder()
        do {
            let result = try! decoder.decode(Results.self, from: homeData)
            var decoderID = HomeModel(id: result.id,
                                      nome: result.name,
                                      status: result.status,
                                      especie: result.species,
                                      imagem: result.image,
                                      created: result.created,
                                      origemnome: result.origin.name,
                                      urlDaOrigem: result.origin.url,
                                      localizacaonome: result.location.name,
                                      urlDaLocalizacao: result.location.url)
            //self.delegate?.didUpdateProfile(self, profile: decoderID)
             return decoderID
            
         }
    //        catch {
    //             // Trate o erro, se necessário
    //             print(error)
    //             return decoderID!
         }
     }

    

