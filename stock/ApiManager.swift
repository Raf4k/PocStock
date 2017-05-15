//
//  ApiManager.swift
//  mHospModular
//
//  Created by Rafał Kampa on 20.04.2017.
//  Copyright © 2017 Rafał Kampa. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD

class ApiManager: NSObject {
    private var errorHandler = ErrorHandler()
    
    class var sharedInstance: ApiManager {
        struct Static {
            static let instance = ApiManager()
        }
        return Static.instance
    }
    
    func getOperation(action: String, params:Dictionary<String, String>, completion: @escaping (Any, Bool) -> (Void)){
        
        SVProgressHUD.show()
        
        Alamofire.request(action, method: .get, parameters: params, encoding: URLEncoding.default, headers: nil).responseString { (data) in
            SVProgressHUD.dismiss()
            
            switch data.result {
            case .success:
                completion (data.result.value!, true);
                break;
            case .failure:
                self.errorHandler.createAlert(error: data.result.value!)
                completion (data.result.value!, false);
                break;
            }
        }
    }
}
