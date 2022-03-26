//
//  AccountSummaryViewHeader.swift
//  Wiley-Bank
//
//  Created by user216422 on 3/24/22.
//

import UIKit

class AccountSummaryViewHeader: UIView{
    
    let stackView = UIStackView()
    let stackView2 = UIStackView()
    let bankName = UILabel()
    let myName = UILabel()
    let date = UILabel()
        //let sfconfig = UIImage.SymbolConfiguration(scale: .large)
    let sfImage = UIImageView()
    //let sfImage = UIImage(systemName: "magnifyingglass.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))
    
    @IBOutlet var contentView: UIView!
    
    //both these handle initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibInit()
        style()
        layout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibInit()
        style()
        layout()
    }

    private func xibInit() {
        
        let bundle = Bundle(for: AccountSummaryViewHeader.self)
        //load the Xib
        bundle.loadNibNamed("AccountSummaryViewHeader", owner: self, options: nil)
        //add the contentView to the stack
        addSubview(contentView)
        
        contentView.backgroundColor = appColor
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        

        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
                
        //old way of doing this
        /*NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])*/
        

    }
    
    override var intrinsicContentSize: CGSize {
            
            return CGSize(width: UIView.noIntrinsicMetric, height: 150)
        }



}

extension AccountSummaryViewHeader{
    func style(){
           /*
            translatesAutoresizingMaskIntoConstraints = false
            backgroundColor = .white
            layer.cornerRadius = 5
            clipsToBounds = true
            */
            bankName.translatesAutoresizingMaskIntoConstraints = false
            bankName.text = "Super Awesome Bank"
            bankName.font = UIFont.preferredFont(forTextStyle: .title3)
            //bankName.textAlignment = .center
            bankName.adjustsFontForContentSizeCategory = true
            bankName.numberOfLines = 0
            bankName.textColor = .white
        
            myName.translatesAutoresizingMaskIntoConstraints = false
            myName.text = "Jeremy"
            myName.textColor = .white
            myName.font = UIFont.preferredFont(forTextStyle: .title3)
            //myName.textAlignment = .center
            myName.adjustsFontForContentSizeCategory = true
            myName.numberOfLines = 0
        
            date.translatesAutoresizingMaskIntoConstraints = false
            date.text = "3/25/2022"
            date.font = UIFont.preferredFont(forTextStyle: .title3)
            //date.textAlignment = .center
            date.adjustsFontForContentSizeCategory = true
            date.numberOfLines = 0
            date.textColor = .white
        
        sfImage.translatesAutoresizingMaskIntoConstraints = false
        sfImage.contentMode = .scaleToFill
        sfImage.contentMode = .scaleAspectFit;     sfImage.image = UIImage(systemName: "dollarsign.square")
        //sfImage.contentMode = .scaleAspectFill
       
            
            //stackview
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            //stackView.setCustomSpacing(10.0, after: bankName)
            stackView.spacing = 20
        
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        
        
        }

    
    func layout() {
            stackView.addArrangedSubview(bankName)
            stackView.addArrangedSubview(myName)
            stackView.addArrangedSubview(date)
        stackView2.addArrangedSubview(stackView)
            stackView2.addArrangedSubview(sfImage)
           
            contentView.addSubview(stackView2)
        
        /*NSLayoutConstraint.activate([
            sfImage.topAnchor.constraint(equalTo: stackView2.topAnchor),
            sfImage.leadingAnchor.constraint(equalTo: stackView2.leadingAnchor),
            sfImage.trailingAnchor.constraint(equalTo: stackView2.trailingAnchor),
            sfImage.bottomAnchor.constraint(equalTo: stackView2.bottomAnchor)
        ])*/
        
        NSLayoutConstraint.activate([
            sfImage.trailingAnchor.constraint(equalTo: stackView2.trailingAnchor),
            sfImage.topAnchor.constraint(equalTo: stackView2.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView2.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        
        NSLayoutConstraint.activate([
            bankName.topAnchor.constraint(equalTo: stackView.topAnchor),
            bankName.leadingAnchor.constraint(equalToSystemSpacingAfter: stackView.leadingAnchor, multiplier: 2),
            
        ])
        
        
           
        

                
       }

}
