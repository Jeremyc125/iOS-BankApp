//
//  AppDelegate.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/21/22.
//

import UIKit

let appColor: UIColor = .systemCyan

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
   
    

    var window: UIWindow?
    let loginViewController = LoginViewController()
    let onboardingSlides = OnboardingSlides()
    
    let logoutViewController = LogoutViewController()
    let mainViewController = MainViewController()
        
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool{
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        
        loginViewController.delegate = self
        logoutViewController.delegate = self
        onboardingSlides.delegate = self
        
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = appColor
        //window?.rootViewController = loginViewController
        window?.rootViewController = mainViewController
        
        //window?.rootViewController = OnboardingSlides()
        //window?.rootViewController = LoginViewController()
        //window?.rootViewController = OnboardingViewController()
        //window?.rootViewController = OnboardingViewController(imageViewName: "Building", labelMessageText: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        
        return true
    }
    
}
extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true){
        guard animated, let window = self.window else{
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
            
        }
        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window, duration: 1, options: .transitionFlipFromRight, animations: nil, completion: nil)

    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin() {
        //print("delegate was called")
        //setRootViewController(onboardingSlides)
        if (SaveData.hasOnboarded){
            setRootViewController(mainViewController)
        }else{
            setRootViewController(onboardingSlides)
        }
    }
}

extension AppDelegate: LogoutViewControllerDelegate{
    func didLogout() {
        setRootViewController(loginViewController)
    }
}

extension AppDelegate: OnboardingSlidesDelegate{
    func didClose() {
        SaveData.hasOnboarded = true
        setRootViewController(logoutViewController)
    }
}


