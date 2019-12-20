//
//  Utils.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

class Utils: NSObject {

    static func setValueInLocal(value:String,Key:String){
        let deflts = UserDefaults.standard
        deflts.set(value, forKey: Key)
    }
    static func getValueFromLocal(Key:String)-> String{
        let deflts = UserDefaults.standard
        let value = deflts.string(forKey: Key)
        return value ?? "0"
    }
    static func updateLayerProperties(button:UIButton) {
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 10.0
        button.layer.cornerRadius = 4.0
        button.layer.masksToBounds = false
    }
}


