//
//  TabBarController.swift
//  SearchRepo
//
//  Created by Hui, Malachi | DCMS on 2021/06/26.
//

import UIKit

class TabBarController: UITabBarController {
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        let repoSearchNavController = createNavController(viewController: RepoSearchController(),
                                                          title: "Search",
                                                          imageName: "searchIcon"
        )
        viewControllers = [repoSearchNavController]
    }
    
    // MARK: Private Methods
    fileprivate func createNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = true
        navController.tabBarItem.title = title
        viewController.navigationItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        return navController
    }
}
