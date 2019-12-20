//
//  Service.swift
//  mcKinseyProject
//
//  Created by shubham tyagi on 18/12/19.
//  Copyright © 2019 shubham tyagi. All rights reserved.
//

import UIKit

class Service: NSObject {

    static func postApi<T:Decodable>(parameter:[String:Any],modalName:T.Type, completionHandler:@escaping (T) -> ()){
        guard let url = URL(string: Constant.webApiUrl) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: []) else {return}
        request.httpBody = httpBody
        
        _ = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let data = data else{return}
                   do{
                    let json = try JSONDecoder().decode(modalName.self, from: data)
                    print(json)
                    completionHandler(json)
                   }catch let jsonerr{
                       print("error-:\(jsonerr.localizedDescription)")
                   }
               }.resume()
    }
}
