//
//  ViewController.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    // Outlet
    @IBOutlet weak var iDTextOutlet:               UITextField!
    @IBOutlet weak var passwordTextField:          UITextField!
    @IBOutlet weak var loginOutlet:                UIButton!
    @IBOutlet weak var bottomConstraintOfLoginBtn: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.iDTextOutlet.delegate      = self
        self.passwordTextField.delegate = self
        changeStatusBarColor()
        Utils.updateLayerProperties(button:loginOutlet)
        allNotfication()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK: Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            UIView.animate(withDuration: 0.5, animations: {
                self.bottomConstraintOfLoginBtn.constant = keyboardHeight
            })
        }
    }
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.5, animations: {
            self.bottomConstraintOfLoginBtn.constant = 40
            
        })
    }
    //MARK: All Notification
    func allNotfication(){
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func loginActn(_ sender: UIButton) {
        if iDTextOutlet.text == "" && passwordTextField.text == ""
        {
            Constant.showToast(message: Constant.ToastMessages.BlankTestField, view: view)
        }
        else if iDTextOutlet.text == "" {
            
            Constant.showToast(message: Constant.ToastMessages.emptyTextID, view: view)
        }
        else if passwordTextField.text == ""{
            Constant.showToast(message: Constant.ToastMessages.emptyTextPswrd, view: view)
        }
            
        else{
        self.loginApi()
        }
    }
    //MARK: LOGIN API CALL
    func loginApi(){
        let email = iDTextOutlet.text!.removingWhitespaces()
        let pwrd  = passwordTextField.text!.removingWhitespaces()
        let res   = isValidEmail(testStr: email)
        
        if res == false {Constant.showToast(message: Constant.ToastMessages.invalidEmail, view: self.view)
            return
        }
        
        let request = ["email":email,"password":pwrd]
        Service.postApi(parameter: request,modalName:LoginModal.self,completionHandler: ({(response) in
            DispatchQueue.main.async {
                
            if response.token != nil{
                Utils.setValueInLocal(value: response.token! , Key: Constant.Token)
                let vc = Constant.Controllers.web.get() as! WebViewController
                vc.token = response.token!
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                Constant.showToast(message: response.error!, view: self.view)
            }
            }
        }))
    }
    
    
}

extension HomeViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
 

