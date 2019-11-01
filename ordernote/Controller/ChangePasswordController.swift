//
//  ChangePasswordController.swift
//  ordernote
//
//  Created by 박일호 on 09/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit

class ChangePasswordController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var currentPw: UITextField!
    @IBOutlet weak var newPw: UITextField!
    @IBOutlet weak var newConfirmPw: UITextField!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var changeBtn: UIButton!
    
    
    @IBAction func clickBtn(_ sender: UIButton) {
        let id = sender.restorationIdentifier
        switch id {
        case "cancel_btn":
            self.dismiss(animated: true, completion: nil)
            break
        case "change_btn":
            // pw check
            let savePw = SettingConst.getPassword()
            let currentPwText = currentPw.text
            let newPwText = newPw.text
            let confirmPwText = newConfirmPw.text
            
            if currentPwText?.count ?? 0 <= 0 {
                showAlert(title: nil, msg: "setting_input_password".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil, confirmHandler: nil, cancelHandler: nil)
                return
            } else if newPwText?.count ?? 0 <= 0 {
                showAlert(title: nil, msg: "setting_input_new_password".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil, confirmHandler: nil, cancelHandler: nil)
                return
            } else if confirmPwText?.count ?? 0 <= 0 {
                showAlert(title: nil, msg: "setting_input_confirm_password".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil, confirmHandler: nil, cancelHandler: nil)
                return
            }
            
            if(savePw == currentPwText) {
                if(newPwText == confirmPwText) {
                    // 비밀번호 변경
                    SettingConst.setPassword(pw: newPwText!)
                    showAlert(title: nil, msg: "setting_complete_password".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil,
                              confirmHandler: { Void in
                                    self.dismiss(animated: true, completion: nil)
                                },
                              cancelHandler: nil)
                } else {
                    showAlert(title: nil, msg: "setting_error_new_password".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil, confirmHandler: nil, cancelHandler: nil)
                }
            } else {
                showAlert(title: nil, msg: "password_error".localized, confirmBtnString: "confirm".localized, cancelBtnString: nil, confirmHandler: nil, cancelHandler: nil)
                return
            }
            
            break
            
        default:
            break
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentPw.addDoneButtonToKeyBoard(myAction: #selector(self.currentPw.resignFirstResponder))
        newPw.addDoneButtonToKeyBoard(myAction: #selector(self.newPw.resignFirstResponder))
        newConfirmPw.addDoneButtonToKeyBoard(myAction: #selector(self.newConfirmPw.resignFirstResponder))
        
        currentPw.delegate = self
        newPw.delegate = self
        newConfirmPw.delegate = self
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = textField.text,
            let rangeofTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeofTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        
        return count <= Const.PASSWORD_DIGIT_COUNT
    }
}
