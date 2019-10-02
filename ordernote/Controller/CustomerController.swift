//
//  CustomerController.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit

class CustomerController: UIViewController {
    override func viewDidLoad() {
        // Navigation bar 설정
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = "title_customer".localized
        var rightBtnImage = UIImage(named: "add_customer")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBtnImage, style: .done, target: self, action: #selector(addCustomer))
    }
    
    @objc func addCustomer() {
        print("click add Customer!!!!!")
        let addCustomer = self.storyboard?.instantiateViewController(withIdentifier: "AddCustomer")
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //            changePassword?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    
        addCustomer?.providesPresentationContextTransitionStyle = true
        addCustomer?.definesPresentationContext = true
        addCustomer?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
                    
        self.present(addCustomer!, animated: true, completion: nil)
    }
}
