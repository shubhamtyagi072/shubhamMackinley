//
//  Constant.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

class Constant: NSObject {
    
    static let appDel = UIApplication.shared.delegate as! AppDelegate
    static let webApiUrl = "https://reqres.in/api/login"
    // DefaultStandard Storage key
    static let Token = "token"
    
    struct StoryBoards {
        static let auth = UIStoryboard(name: "Main", bundle: nil)
    }
    struct ToastMessages {
        static let BlankTestField = "Please fill all details"
        static let emptyTextID    = "ID cannot be blank"
        static let emptyTextPswrd = "Password cannot be blank"
        static let invalidEmail   = "Email not valid"
    }
    enum Controllers {
        case login
        case web
        
        func get()->UIViewController{
            switch self {
                
            case .login:
                return StoryBoards.auth.instantiateViewController(withIdentifier: String(describing: HomeViewController.self))
                
            case .web:
                return StoryBoards.auth.instantiateViewController(withIdentifier: String(describing: WebViewController.self))
                
                
                
            }
        }
    }
    
    static func showToast(message : String, view: UIView) {
        let toastLabel = UILabel(frame: CGRect(x:view.frame.size.width/2 - 125, y:50, width: 250, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
  //      toastLabel.font = font
        toastLabel.textAlignment = .center
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: { toastLabel.alpha = 0.0 }, completion: {(isCompleted) in toastLabel.removeFromSuperview()
            
        })
    
    }
}

