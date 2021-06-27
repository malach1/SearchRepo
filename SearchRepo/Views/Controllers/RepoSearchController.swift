//
//  RepoSearchController.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/26.
//

import UIKit

class RepoSearchController: UICollectionViewController {
    // MARK: PROPERTIES
    fileprivate let viewModel = RepoSearchViewModel()
    fileprivate let cellID = "repoCell"
    fileprivate let searchController = UISearchController(searchResultsController: nil)

    var timer: Timer?

    // MARK: Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initializeSearchBar()
        viewModel.networkManager.delegate = self
        collectionView.backgroundColor = .black
        collectionView.register(RepoSearchCell.self, forCellWithReuseIdentifier: cellID)
    }

    fileprivate func initializeSearchBar() {
        definesPresentationContext = true
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.searchBar.placeholder = "Search for repositories"
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }

    // MARK: CollectionView
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! RepoSearchCell
        
        let repoDetails = viewModel.getRepositoryDetails(itemAtIndex: indexPath.item)
        cell.repo_name.text = repoDetails.name
        cell.repo_language.text = repoDetails.language
        cell.repo_description.text = repoDetails.description
        cell.repo_url.text = repoDetails.html_url
        
        guard let owner = repoDetails.owner else { return cell }
        guard let avatarUrl = owner.avatar_url else { return cell }
        cell.repo_avatar.imageFromServerURL(avatarUrl, placeHolder: UIImage(named: "placeholder_icon"))

        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getRepositoryCount()
    }
}

// MARK: EXTENSIONS
extension RepoSearchController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 150)
    }
}

extension RepoSearchController: RepositoryFetchDelegate {
    func repoFetchComplete() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension RepoSearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        timer?.invalidate() // request throttle
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            self.viewModel.searchForRepository(query: searchText)
        })
    }
}
