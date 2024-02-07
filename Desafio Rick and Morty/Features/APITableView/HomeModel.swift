//
//  HomeModel.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 16/11/23.
//

import Foundation

struct HomeModel: Decodable {
    let id: Int
    let nome: String
    let status: String
    let especie: String
    let imagem: String
    let created: String
    let origemnome: String
    let urlDaOrigem: String
    let localizacaonome: String
    let urlDaLocalizacao: String
}
