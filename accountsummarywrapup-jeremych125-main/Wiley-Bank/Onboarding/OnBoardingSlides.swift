//
//  OnBoardingSlides.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/21/22.
//


import UIKit

protocol OnboardingSlidesDelegate: AnyObject{
    func didClose()
}

class OnboardingSlides: UIViewController{
    
    let slidesViewController: UIPageViewController
    var slides = [UIViewController]()
    
    weak var delegate: OnboardingSlidesDelegate?
    
    var currentSlide: UIViewController{
        didSet{
        }
    }
    
    let closeButton = UIButton()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
         self.slidesViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
         
        let slide1 = OnboardingViewController(imageViewName:"Building", labelMessageText:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        let slide2 = OnboardingViewController(imageViewName:"Earth", labelMessageText:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
        let slide3 = OnboardingViewController(imageViewName:"HR", labelMessageText:  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
         
         slides.append(slide1)
         slides.append(slide2)
         slides.append(slide3)
         
         currentSlide = slides.first!
         
         super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
     }

     required init?(coder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }

}

class Slide1: UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .systemRed
    }
}
class Slide2: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
    }
}

class Slide3: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
}


extension OnboardingSlides{
    func style(){
        view.backgroundColor = .systemMint
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.setTitle("Close", for: [])
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)

    }
    
    func layout() {
        
        addChild(slidesViewController)
        view.addSubview(slidesViewController.view)
        view.addSubview(closeButton)
        
        slidesViewController.didMove(toParent: self)
        slidesViewController.dataSource = self
        slidesViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: slidesViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: slidesViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: slidesViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: slidesViewController.view.bottomAnchor),
        ])
        NSLayoutConstraint.activate([
            //leading and right two units, each unit is 8 pixels
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            //top and down two units, each unit is 8 pixels
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier:2)
            ])

        
        slidesViewController.setViewControllers([slides.first!], direction: .forward, animated: false, completion: nil)
        currentSlide = slides.first!
    }
}


extension OnboardingSlides: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = slides.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentSlide = slides[index - 1]
        return slides[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = slides.firstIndex(of: viewController), index + 1 < slides.count else { return nil }
        currentSlide = slides[index + 1]
        return slides[index + 1]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return slides.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return slides.firstIndex(of: self.currentSlide) ?? 0
    }
}

extension OnboardingSlides{
    @objc func closeButtonTapped(_sender: UIButton){
        //print("close button tapped")
        didFinishOnboarding()
    }
    func didFinishOnboarding(){
        delegate?.didClose()
    }
}

