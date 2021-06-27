//
//  NetworkManager.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/25.
//

import Foundation
import UIKit

protocol RepositoryFetchDelegate {
    func repoFetchComplete()
}

class NetworkManager {
    // MARK: PROPERTIES
    var repoResults = [Items]()
    var delegate:RepositoryFetchDelegate?
    
    // MARK: Interface
    func findRepositories(query: String) {
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
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                self.repoResults = searchResult.items
                self.delegate?.repoFetchComplete()
            } catch let jsonError{
                print("Failed to decode with error:", jsonError)
            }
        }.resume()
    }
}
