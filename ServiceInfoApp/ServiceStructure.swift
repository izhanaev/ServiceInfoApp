//
//  ServiceStructure.swift
//  ServiceInfoApp
//
//  Created by Ильяс Жанаев on 27.03.2024.
//

import Foundation

struct SocNetwork: Decodable {
    let name: String
    let description: String
    let link: String
    let icon_url: String
}

struct Services: Decodable {
    let services: [SocNetwork]
}

struct NetworkData: Decodable {
    let body: Services
}
