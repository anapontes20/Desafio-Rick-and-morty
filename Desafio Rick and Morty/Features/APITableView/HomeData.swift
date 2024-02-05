//
//  HomeData.swift
//  Desafio Rick and Morty
//
//  Created by Ana Pontes on 16/11/23.
//

import Foundation

struct RickAndMorty: Codable {
    let info: Info?
    let results: [Results]
    init(info: Info?, results: [Results]) {
        self.info = info
        self.results = results
    }
}
struct Info: Codable {
    let count: Int
    let pages: Int
    let next: String
    let prev: String?
    init(count: Int, pages: Int, next: String, prev: String?) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
}

struct Results: Codable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: Origin
    let location: Location
    let image: String
    let episode: [String]
    let url: String
    let created: String
    init(id: Int, name: String, status: String, species: String, type: String, gender: String, origin: Origin, location: Location, image: String, episode: [String], url: String, created: String) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episode = episode
        self.url = url
        self.created = created
    }
}

struct Origin: Codable {
    let name: String
    let url: String
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}

struct Location: Codable{
    let name: String
    let url: String
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
}
