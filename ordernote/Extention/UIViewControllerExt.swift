//
//  UIViewControllerExt.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

extension UIViewController {
    func showToast(message: String) {
        let width = self.view.frame.size.width - 50
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - (width/2), y: self.view.frame.size.height-100, width: width, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showAlert(title: String!, msg: String, confirmBtnString: String, cancelBtnString: String!, confirmHandler: ((UIAlertAction) -> Void)!, cancelHandler: ((UIAlertAction) -> Void)!) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        
        if(cancelBtnString != nil) {
            let cancel = UIAlertAction(title: cancelBtnString, style: .cancel, handler: cancelHandler)
            alert.addAction(cancel)
        }
        
        let confirm = UIAlertAction(title: confirmBtnString, style: .default, handler: confirmHandler)
        alert.addAction(confirm)
        
        present(alert, animated: false, completion: nil)
    }
}
