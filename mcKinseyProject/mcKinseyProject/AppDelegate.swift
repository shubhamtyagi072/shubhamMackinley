//
//  AppDelegate.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 20/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        self.setFlow()
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    //    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    //        // Called when a new scene session is being created.
    //        // Use this method to select a configuration to create the new scene with.
    //        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    //    }
    
    //    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    //        // Called when the user discards a scene session.
    //        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    //        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    //    }
    //MARK: set flow
    
    func setFlow() {
        let token = Utils.getValueFromLocal(Key: Constant.Token)
        print(token,"token")
        if  token != "0" {
            Constant.appDel.setWebPage()
        }else{
            Constant.appDel.setLoginPage()
        }
    }
    
    
    
    //MARK: setting rootVC
    
    func setLoginPage()
    {
        let mainVC = Constant.Controllers.login.get() as! HomeViewController
        let navigationVC = UINavigationController.init(rootViewController: mainVC)
        navigationVC.isNavigationBarHidden = true
        window?.rootViewController = navigationVC
        
        
    }
    func setWebPage()
    {
        let mainVC = Constant.Controllers.web.get() as! WebViewController
        let navigationVC = UINavigationController.init(rootViewController: mainVC)
        navigationVC.isNavigationBarHidden = true
        window?.rootViewController = navigationVC
        
        
    }
}


