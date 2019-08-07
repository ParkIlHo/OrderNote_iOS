//
//  ViewController.swift
//  ordernote
//
//  Created by 박일호 on 06/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testBtn: UIButton!
    @IBAction func clickBtn(_ sender: Any) {
       
        let password2 = self.storyboard?.instantiateViewController(withIdentifier: "PasswordController") as! UIViewController
        let password = PasswordController()
        self.navigationController?.pushViewController(password2, animated: false)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("testtesttest")
    }


}

