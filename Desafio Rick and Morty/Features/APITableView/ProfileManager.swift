//
//  ProfileManager.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 05/02/24.
//

import Foundation


//protocol ProfileManagerDelegate {
//    func didUpdateProfile(_ _profileManager: ProfileManager, profile: HomeModel)
//}
class ProfileManager {
    
    ////MARK: - CHAMADA API TELA DETALHES
    //
    //    var urlProfile = "https://rickandmortyapi.com/api/character/"
    ////    var delegate: ProfileManagerDelegate?
    //
    //func callApiId(id:Int) {
    //    if let url = URL(string: "\(urlProfile)\(id)") {
    //        let session = URLSession(configuration: .default)
    //        let task = session.dataTask(with: url) { data, response, error in
    //            if error != nil {
    //                //   print(error)
    //            }
    //            if let data = data  {
    //                  print(data)
    //                let home = self.parseJSONID(data)
    //            }
    //        }
    //        task.resume()
    //    }
    //}
    //
    //func parseJSONID(_ homeData: Data) -> HomeModel {
    //    //print(homeData)
    //    let decoder = JSONDecoder()
    //    do {
    //        let result = try! decoder.decode(Results.self, from: homeData)
    //        var decoderID = HomeModel(id: result.id,
    //                                  nome: result.name,
    //                                  status: result.status,
    //                                  especie: result.species,
    //                                  imagem: result.image,
    //                                  created: result.created,
    //                                  origemnome: result.origin.name,
    //                                  urlDaOrigem: result.origin.url,
    //                                  localizacaonome: result.location.name,
    //                                  urlDaLocalizacao: result.location.url)
    //        //self.delegate?.didUpdateProfile(self, profile: decoderID)
    //         return decoderID
    //
    //     }
    ////        catch {
    ////             // Trate o erro, se necessário
    ////             print(error)
    ////             return decoderID!
    //     }
    // }
}
