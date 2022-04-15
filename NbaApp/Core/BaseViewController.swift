//
//  BaseViewController.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import UIKit

class BaseViewController: UIViewController {
    
    //lazy var greyView: UIView = UIView()
    //lazy var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    func activityIndicatorBegin() {
        activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) {
            activityIndicator.style = UIActivityIndicatorView.Style.large
            activityIndicator.color = .gray
        }else{
            activityIndicator.style = UIActivityIndicatorView.Style.gray
        }
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()


        greyView.frame = CGRect(x: 0, y: 0, width: self.screenWidth, height: self.screenHeight)
        greyView.backgroundColor = .black
        greyView.alpha = 0.2
        self.view.addSubview(greyView)
    }

    func activityIndicatorEnd() {
        self.activityIndicator.stopAnimating()
        self.greyView.removeFromSuperview()
    }
     */
}
