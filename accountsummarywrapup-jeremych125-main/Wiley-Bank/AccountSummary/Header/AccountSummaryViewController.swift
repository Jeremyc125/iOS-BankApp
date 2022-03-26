//
//  AccountSummaryViewController.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/24/22.
//
import UIKit

class AccountSummaryViewController: UIViewController {
    //let stackView = UIStackView()
    //let label = UILabel()
    /*let list = [
            "Test1", "Test2", "Test3", "Test4", "Test5", "Test6", "Test7"
        ]*/
    var accounts: [AccountSummaryCell.ViewModel] = []
        
    var tableView = UITableView()

    
    override func viewDidLoad(){
        super.viewDidLoad()
        setup()
        style()
        layout()
        fetchData()
    }
}

extension AccountSummaryViewController {
    func style(){
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            
                    }
        func layout(){
            

            //add tableview to subview
            view.addSubview(tableView)
            
            

            //table view constraints
            NSLayoutConstraint.activate([
                
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }
    
    
    func setup() {
            //tableView
            tableView.backgroundColor = appColor
            tableView.delegate = self
            tableView.dataSource = self
            //tableHeader
            let header = AccountSummaryViewHeader(frame: .zero)
            var size = header.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
            size.width = UIScreen.main.bounds.width
        
            header.frame.size = size
            tableView.tableHeaderView = header
        
            //TableCell
            tableView.register(AccountSummaryCell.self, forCellReuseIdentifier: AccountSummaryCell.reuseID)
            tableView.rowHeight = CGFloat(AccountSummaryCell.rowHeight)
            
            //creating an empty View will give the tableView no footer.
            //table views typically have a header and footer
            tableView.tableFooterView = UIView()

        }

}
extension AccountSummaryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            !accounts.isEmpty
        else{
            return UITableViewCell()
        }
        //how to populate the tableview
        //let cell = UITableViewCell()
        //cell.textLabel?.text = list[indexPath.row]
        //return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: AccountSummaryCell.reuseID, for: indexPath) as! AccountSummaryCell
        
        let account = accounts[indexPath.row]
        cell.configure(with: account)
        return cell

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accounts.count
    }
}

//fix delegate creation problem
extension AccountSummaryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AccountSummaryViewController {
    private func fetchData() {
        let savings = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                            accountName: "Basic Savings",
                                                        balance: 929466.23)
        let chequing = AccountSummaryCell.ViewModel(accountType: .Banking,
                                                    accountName: "No-Fee All-In Chequing",
                                                    balance: 17562.44)
        let visa = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Visa Avion Card",
                                                       balance: 412.83)
        let masterCard = AccountSummaryCell.ViewModel(accountType: .CreditCard,
                                                       accountName: "Student Mastercard",
                                                       balance: 50.83)
        let investment1 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Tax-Free Saver",
                                                       balance: 2000.00)
        let investment2 = AccountSummaryCell.ViewModel(accountType: .Investment,
                                                       accountName: "Growth Fund",
                                                       balance: 15000.00)

        accounts.append(savings)
        accounts.append(chequing)
        accounts.append(visa)
        accounts.append(masterCard)
        accounts.append(investment1)
        accounts.append(investment2)
    }
}




