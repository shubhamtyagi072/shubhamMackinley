//
//  LoginModal.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

struct LoginModal:Decodable {
    var token:String?
    var error:String?
    
    enum CodingKey:String{
        case token = "token"
        case error = "error"
    }
}
