//
//  Utilities.swift
//  stock
//
//  Created by Rafał Kampa on 04.05.2017.
//  Copyright © 2017 Rafał Kampa. All rights reserved.
//

import UIKit

class ErrorHandler: NSObject {
    func createAlert(error: String) {
        let alertController: UIAlertController = UIAlertController(title: otherDefines.error, message: error, preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: otherDefines.ok, style: UIAlertActionStyle.cancel) { (action) in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(alertAction)
        
        UIApplication.shared.keyWindow?.rootViewController?.present(alertController, animated: true, completion: nil)
    }
}
