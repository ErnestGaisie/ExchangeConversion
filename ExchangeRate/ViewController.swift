//
//  ViewController.swift
//  ExchangeRate
//
//  Created by Ernest Gaisie on 10/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var ExchangeView: UIView!
    @IBOutlet weak var USDTextField: UITextField!
    @IBOutlet weak var GHSTextField: UITextField!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ExchangeView.layer.borderWidth = 1.0
        ExchangeView.layer.borderColor = UIColor.lightGray.cgColor
        ExchangeView.layer.cornerRadius = 5
        
        self.rateLabel.layer.borderColor = UIColor.lightGray.cgColor
        self.rateLabel.layer.borderWidth = 1.0
        
        USDTextField.addTarget(self, action: #selector(self.calculateGHS(_:)), for: .editingChanged)
        GHSTextField.addTarget(self, action: #selector(self.calculateUSD(_:)), for: .editingChanged)
        
        self.isEditing = true

   }
    

    @objc func calculateGHS(_ textfield: UITextField){
        
        
        
        if USDTextField.text! != ""
            {
            ExchangeView.layer.borderColor = UIColor.blue.cgColor
                if let USD = Double(USDTextField.text!)
                {
                    let newGHS = ExchangeRate.sharedInstance.USDGHS(u: USD)
                    GHSTextField.text = "\(round(100 * newGHS) / 100)"
                }
        }else{
            GHSTextField.text = ""
            ExchangeView.layer.borderColor = UIColor.lightGray.cgColor
        }
       
        
    }
    
    @objc func calculateUSD(_ textfield: UITextField){
        
       
        
        if GHSTextField.text! != ""
        {
             ExchangeView.layer.borderColor = UIColor.blue.cgColor
            if let GHS = Double(GHSTextField.text!)
            {
                let newUSD = ExchangeRate.sharedInstance.GHSUSD(i: GHS)
                USDTextField.text = "\(round(100 * newUSD) / 100)"
            }
        }else{
            USDTextField.text = ""
             ExchangeView.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    


}

