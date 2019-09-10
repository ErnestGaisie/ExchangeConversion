//
//  Exchange.swift
//  ExchangeRate
//
//  Created by Ernest Gaisie on 10/09/2019.
//  Copyright © 2019 Ernest Gaisie. All rights reserved.
//

import Foundation

private let ExchangeRateInstance = ExchangeRate()

class ExchangeRate {
  
    
    class var sharedInstance: ExchangeRate
    {
        return ExchangeRateInstance
    }
    
    func GHSUSD(i: Double) -> Double{
        return i / 3.95
    }
    
    func USDGHS(u: Double) -> Double {
        return u * 3.95
    }
    
    
}
