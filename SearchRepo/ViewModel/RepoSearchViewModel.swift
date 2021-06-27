//
//  RepoSearchViewModel.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/27.
//

import Foundation

class RepoSearchViewModel: NSObject {
    // MARK: PROPERTIES
    let networkManager = NetworkManager()
    
    // MARK: Public Interfaces
    func getRepositoryDetails(itemAtIndex: Int) -> Items {
        return self.networkManager.repoResults[itemAtIndex]
    }
    
    func getRepositoryCount() -> Int {
        return self.networkManager.repoResults.count
    }
    
    func searchForRepository(query: String) {
        self.networkManager.findRepositories(query: query)
    }
}
