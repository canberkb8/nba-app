//
//  Utils.swift
//  NbaApp
//
//  Created by Canberk Bibican on 9.04.2022.
//

import Foundation
import UIKit

class Utils {
    
    //------------------------------------Component yapılcak-----------------------------------//
    lazy var greyView: UIView = UIView()
    lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func activityIndicatorBegin() {
        let topController = UIApplication.shared.topViewController!
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.center = topController.view.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = .gray
        }else{
            activityIndicator.style = UIActivityIndicatorView.Style.gray
        }
        topController.view.addSubview(activityIndicator)
        activityIndicator.startAnimating()


        greyView.frame = CGRect(x: 0, y: 0, width: topController.screenWidth, height: topController.screenHeight)
        greyView.backgroundColor = .black
        greyView.alpha = 0.2
        topController.view.addSubview(greyView)
    }

    func activityIndicatorEnd() {
        self.activityIndicator.stopAnimating()
        self.greyView.removeFromSuperview()
    }
    
    //------------------------------------------------------------------------------------------//
    
    func globalAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

        // show the alert
        let topController = UIApplication.shared.topViewController
        topController?.present(alert, animated: true, completion: nil)
    }
}
