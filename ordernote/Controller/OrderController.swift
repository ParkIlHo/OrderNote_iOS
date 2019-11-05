//
//  OrderController.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit

class OrderController: UIViewController {
    
    // MARK: override
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = "title_order".localized
        
        var rightBtnImage = UIImage(named: "add_order")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBtnImage, style: .done, target: self, action: #selector(addOrder))
    }
    
    // MARK: Add Order View
    @objc func addOrder() {
        print("click add Order!!!!!")
        let addOrder = self.storyboard?.instantiateViewController(withIdentifier: "AddOrder") as! AddOrderController
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //            changePassword?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    
        addOrder.providesPresentationContextTransitionStyle = true
        addOrder.definesPresentationContext = true
        addOrder.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
//        addOrder.delegate = self
                    
        self.present(addOrder, animated: true, completion: nil)
    }
}
