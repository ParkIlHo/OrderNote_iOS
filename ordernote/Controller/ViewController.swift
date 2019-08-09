//
//  ViewController.swift
//  ordernote
//
//  Created by 박일호 on 06/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var settingBtn: UIButton!
    @IBOutlet weak var orderBtn: UIButton!
    @IBOutlet weak var customerBtn: UIButton!
    @IBAction func clickSetting(_ sender: UIButton) {
        showToast(message: "click setting")
        let setting = self.storyboard?.instantiateViewController(withIdentifier: "SettingController") as! UIViewController
        self.navigationController?.pushViewController(setting, animated: true)
    }
    @IBAction func clickBtn(_ sender: UIButton) {
        let id = sender.restorationIdentifier
        
        switch id {
        case "btn_order":
            showToast(message: "go order")
            let order = self.storyboard?.instantiateViewController(withIdentifier: "OrderController") as! UIViewController
            self.navigationController?.pushViewController(order, animated: true)
        case "btn_customer":
            showToast(message: "go customer")
            let customer = self.storyboard?.instantiateViewController(withIdentifier: "CustomerController") as! UIViewController
            self.navigationController?.pushViewController(customer, animated: true)
        default:
            print("default")
        }
//        let password2 = self.storyboard?.instantiateViewController(withIdentifier: "PasswordController") as! UIViewController
//        let password = PasswordController()
//        self.navigationController?.pushViewController(password2, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("testtesttest")
        
        self.navigationController?.navigationBar.backgroundColor = UIColor.init(named: "colorMain")
        self.navigationController?.navigationBar.topItem?.title = "title".localized
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "title".localized
    }
    

}

