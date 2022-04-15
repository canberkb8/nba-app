//
//  UIViewController.swift
//  NbaApp
//
//  Created by Canberk Bibican on 31.03.2022.
//

import Foundation
import UIKit

extension UIViewController {

    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }

    public var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }

    func alertDialog(title: String, message: String, ok: @escaping () -> Void = { }) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default: ok()
            case .cancel: break
            case .destructive: break
            @unknown default: fatalError()
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
