//
//  RepoSearchController.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/26.
//

import UIKit

class RepoSearchController: UICollectionViewController {
    
    fileprivate let networkManager = NetworkManager()
    fileprivate let cellID = "repoCell"
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .yellow
        // register cell
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        // call network
        networkManager.findRepositories(matching: "test")
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
}

extension RepoSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 250)
    }
}
