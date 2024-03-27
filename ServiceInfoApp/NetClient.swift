//
//  NetClient.swift
//  ServiceInfoApp
//
//  Created by Ильяс Жанаев on 27.03.2024.
//

import Foundation

class NetClient {
    func fetchData() async throws -> [SocNetwork] {
        guard let url = URL(string: "https://publicstorage.hb.bizmrg.com/sirius/result.json") else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        let networkData = try decoder.decode(NetworkData.self, from: data)
        return networkData.body.services
    }
}
