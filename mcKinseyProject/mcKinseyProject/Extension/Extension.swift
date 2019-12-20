//
//  Extension.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

extension UIViewController {
   func isValidEmail(testStr:String) -> Bool {

        print("validate emilId: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluate(with: testStr)
        return result

    }
    func changeStatusBarColor()
    {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = UIColor(red: 30/255, green: 72/255, blue: 153/255, alpha: 1)
            view.addSubview(statusbarView)
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = UIColor(red: 30/255, green: 72/255, blue: 153/255, alpha: 1)
        }
    }
}

extension String {
    func removingWhitespaces() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

@IBDesignable extension UIButton {
    @IBInspectable var imageColor: UIColor {
        get {
            return tintColor
        }
        set {
            tintColor = newValue
            
        }
    }
}
extension UITextField {
    @IBInspectable var borderWidth : CGFloat {
        set {
            layer.borderWidth = newValue
        }
        
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable  var borderColor : UIColor   {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor  = newValue.cgColor
        }
    }
    @IBInspectable  var paddingLeft : CGFloat   {
        
        //iDTextOutlet.leftViewMode = .always
        get {
            
            return self.leftView?.frame.size.width ?? 5.0
        }
        set {
            let view =  UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: 20))
            self.leftView = view
            self.leftViewMode = .always
            
        }
    }
}
