//
//  PasswordController.swift
//  ordernote
//
//  Created by 박일호 on 06/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

class PasswordController: UIViewController, UITextFieldDelegate {
    // MARK:
    // MARK: IBOutlet
    @IBOutlet var mainview: UIView!
    @IBOutlet weak var confirmBtn: UIButton!
    @IBOutlet weak var inputPassword: UITextField!
    
    // MARK:
    // MARK: IBAction
    @IBAction func clickBtn(_ sender: UIButton) {
        print("PasswordController:: confirmBtn click")
        var curPw = UserDefaults.standard.string(forKey: Const.KEY_PASSWORD)
        if(curPw == nil) {
            curPw = "0000"
        }
        let inputPw = inputPassword.text
        
        if(curPw == inputPw) {
            self.navigationController?.popViewController(animated: true)
        } else {
            showToast(message: "password_error".localized)
            print("password_error".localized)
        }
    }
    
    // MARK:
    // MARK: override func
    override func viewDidLoad() {
        print("PasswordController")
        
        confirmBtn.isHidden = true
        inputPassword.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    // MARK:
    // MARK: UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeofTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeofTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        if(count < Const.PASSWORD_DIGIT_COUNT) {
            confirmBtn.isHidden = true
        } else {
            confirmBtn.isHidden = false
        }
        return count <= Const.PASSWORD_DIGIT_COUNT
    }
}
