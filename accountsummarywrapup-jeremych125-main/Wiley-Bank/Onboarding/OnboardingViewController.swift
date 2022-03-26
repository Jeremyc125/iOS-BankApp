import UIKit

class OnboardingViewController: UIViewController {
    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    let closeButton = UIButton()
    
    var imageName: String
    var messageText: String
    
    init(imageViewName: String, labelMessageText: String){
        self.imageName = imageViewName
        self.messageText = labelMessageText
        
        super.init(nibName: nil, bundle: nil)
    }
    //auto fix
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension OnboardingViewController {
    func style(){
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .vertical
         stackView.spacing = 20
         
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFit
         imageView.image = UIImage(named: imageName)
         
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = messageText
         label.font = UIFont.preferredFont(forTextStyle: .title3)
         label.textAlignment = .center
         label.adjustsFontForContentSizeCategory = true
         label.numberOfLines = 0
        
         closeButton.translatesAutoresizingMaskIntoConstraints = false
         closeButton.setTitle("Close", for: [])
         closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .primaryActionTriggered)

     }


    
    func layout(){
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)

        view.addSubview(stackView)
        view.addSubview(closeButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier:2)
        ])
        
    }
}
extension OnboardingViewController {
    @objc func closeButtonTapped(_sender: UIButton){
        print("close button tapped")
    }
}

