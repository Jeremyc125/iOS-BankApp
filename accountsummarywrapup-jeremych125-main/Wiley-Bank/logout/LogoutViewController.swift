import UIKit

protocol LogoutViewControllerDelegate: AnyObject{
    func didLogout()
}

class LogoutViewController: UIViewController {
    let stackView = UIStackView()
    let label = UILabel()
    let logoutButton = UIButton(type: .system)
    
    weak var delegate: LogoutViewControllerDelegate?
    
    //var messageText: String
    
    /*init( labelMessageText: String){
        self.messageText = labelMessageText
        
        super.init(nibName: nil, bundle: nil)
    }
    //auto fix
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }*/


    override func viewDidLoad(){
        super.viewDidLoad()
        style()
        layout()
    }
}

extension LogoutViewController{
    
    func style(){
         stackView.translatesAutoresizingMaskIntoConstraints = false
         stackView.axis = .vertical
         stackView.spacing = 0
         
         
         
         label.translatesAutoresizingMaskIntoConstraints = false
         label.text = "Logout?"
         label.font = UIFont.preferredFont(forTextStyle: .title3)
         label.textAlignment = .center
         label.adjustsFontForContentSizeCategory = true
         label.numberOfLines = 0
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.configuration?.imagePadding = 8
        logoutButton.setTitle("Logout", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .primaryActionTriggered)

     }


    
    func layout(){
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(logoutButton)
        

        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            //our loginView's center will the center of the View's Center
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            //our loginView's leading anchor will be the view's lead, + 8 (the multiplier is 8x)
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            //our view's trailing anchor will be +8 on the loginView's trailing anchor
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
        
        
    }
    
}
extension LogoutViewController {
    @objc func logoutButtonTapped(_sender: UIButton){
        logout()
    }
    func logout(){
        
        delegate?.didLogout()
            

    
    }
}
