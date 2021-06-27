//
//  RepoSearchCell.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/26.
//

import UIKit

class RepoSearchCell:UICollectionViewCell {
    
    // MARK: UI PROPERTIES
    var repo_name: UILabel = {
        let label = UILabel()
        label.text = "Username"
        return label
    }()
    
    var repo_language: UILabel = {
        let label = UILabel()
        label.text = "Swift"
        return label
    }()
    
    var repo_url: UILabel = {
        let label = UILabel()
        label.text = "url"
        label.numberOfLines = 0
        return label
    }()
    
    var repo_description: UILabel = {
        let label = UILabel()
        label.text = "This is the description"
        label.numberOfLines = 3
        return label
    }()
    
    var repo_avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    // MARK: Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .gray
        layoutCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Methods
    private func layoutCell() {
        
        addSubview(repo_avatar)
        repo_avatar.translatesAutoresizingMaskIntoConstraints = false
        repo_avatar.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        repo_avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        
        addSubview(repo_name)
        repo_name.translatesAutoresizingMaskIntoConstraints = false
        repo_name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        repo_name.leadingAnchor.constraint(equalTo: repo_avatar.trailingAnchor, constant: 3).isActive = true
        
        addSubview(repo_language)
        repo_language.translatesAutoresizingMaskIntoConstraints = false
        repo_language.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        repo_language.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        
        let stackViewBottom = UIStackView(arrangedSubviews: [
            repo_url, repo_description
        ])
        stackViewBottom.spacing = 5
        stackViewBottom.axis = .vertical
        
        addSubview(stackViewBottom)
        stackViewBottom.translatesAutoresizingMaskIntoConstraints = false
        stackViewBottom.topAnchor.constraint(equalTo: repo_name.bottomAnchor, constant: 10).isActive = true
        stackViewBottom.leadingAnchor.constraint(equalTo: repo_avatar.trailingAnchor, constant: 5).isActive = true
        stackViewBottom.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
}
