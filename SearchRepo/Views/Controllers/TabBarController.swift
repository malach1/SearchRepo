//
//  TabBarController.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let repoSearchNavController = createNavController(viewController: RepoSearchController(), title: "Search", imageName: "searchIcon", backgroundColor: .yellow)
        
        viewControllers = [repoSearchNavController]
    }
    
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String, backgroundColor: UIColor) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        viewController.view.backgroundColor = backgroundColor
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
