//
//  MainViewController.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/24/22.
//

import UIKit

class MainViewController: UITabBarController{
    
    //let tabViewController = UITabBarController()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setupViews()
        setupTabBar()
    }
}



class MoveMoneyViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemOrange
    }
}

class MoreViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemPurple
    }
}

extension MainViewController{
    private func setupViews() {
        let summaryVC = AccountSummaryViewController()
        let moneyVC = MoveMoneyViewController()
        let moreVC = MoreViewController()

        summaryVC.setTabBarImage(imageSFName: "list.dash.header.rectangle", title: "Summary", tag: 0)
        moneyVC.setTabBarImage(imageSFName: "arrow.left.arrow.right", title: "Move Money", tag: 1)
        moreVC.setTabBarImage(imageSFName: "ellipsis.circle", title: "More", tag: 2)

        let summaryNC = UINavigationController(rootViewController: summaryVC)
        let moneyNC = UINavigationController(rootViewController: moneyVC)
        let moreNC = UINavigationController(rootViewController: moreVC)

        summaryNC.navigationBar.barTintColor = appColor
        
        let img = UIImage()
        summaryNC.navigationBar.shadowImage = img
        summaryNC.navigationBar.setBackgroundImage(img, for: .default)
        summaryNC.navigationBar.isTranslucent = false
        
        //this was a custom function
        //hideNavigationBarLine(summaryNC.navigationBar)
        
        let tabBarList = [summaryNC, moneyNC, moreNC]

        viewControllers = tabBarList
    }

    private func setupTabBar() {
        tabBar.tintColor = appColor
        tabBar.isTranslucent = false
    }
}


