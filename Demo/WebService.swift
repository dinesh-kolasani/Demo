//
//  Webser.swift
//  Demo
//
//  Created by Macbook Air on 07/04/21.
//  Copyright © 2021 Dinesh. All rights reserved.
//

import UIKit
import Alamofire

class WebService: NSObject {
    static let shared:WebService = {
        
        let sharedInsatnce = WebService()
        return sharedInsatnce
    }()
    
    //MARK: - Api Get Method
    func apiGet(url:String,parameters:[String:Any] , completion: @escaping (_ data:Data? , _ error:Error?) -> Void)
    {
        print(url)
        print(parameters)
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 120
        
        manager.request(url, method:.get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in            
            
            if response.result.isSuccess
            {
                print("Response Data: \(response)")
                
                if let data = response.result.value
                {
                    let jsonData = try! JSONSerialization.data(withJSONObject: data, options: [])
                    completion(jsonData , nil)
                    
                }
                else{
                    
                    completion(nil,response.error)
                }
            }
            else
            {
                completion(nil,response.error)
                print("Error \(String(describing: response.result.error))")
            }
            
        }
    }
}
