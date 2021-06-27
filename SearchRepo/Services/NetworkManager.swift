//
//  NetworkManager.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/25.
//

import Foundation

class NetworkManager {

    struct SearcResult: Decodable {
        let items: [Items]
    }
    
    struct Items: Decodable {
        let name: String
    }
    
    
    func findRepositories(matching query: String) {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.github.com"
        components.path = "/search/repositories"
        components.queryItems = [
            URLQueryItem(name: "q", value: query),
        ]

        guard let url = components.url else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Failed to get repositories:", error)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearcResult.self, from: data)
                searchResult.items.forEach({
                    print($0.name)
                })
            } catch let jsonError{
                print("Failed to decode:", jsonError)
            }
        }.resume()
    }
}
