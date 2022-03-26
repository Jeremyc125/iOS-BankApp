//
//  UIViewControllerUtils.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/24/22.
//


import UIKit

extension UIViewController{
    func setTabBarImage(imageSFName: String, title: String, tag: Int){
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageSFName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: tag)
    }
    func setStatusBar(){
       let statusBarSize = UIApplication.shared.statusBarFrame.size
       let frame = CGRect(origin: .zero, size: statusBarSize)
       let statusBarView = UIView(frame: frame)
       
       statusBarView.backgroundColor = appColor
       view.addSubview(statusBarView)
       }

}
