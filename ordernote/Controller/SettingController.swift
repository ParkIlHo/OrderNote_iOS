//
//  SettingController.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    @IBOutlet weak var pwChangeBtn: UIButton!
    @IBOutlet weak var screenLock: UISwitch!
    @IBOutlet weak var LockTimeView: UIView!
    @IBOutlet weak var inputLockTime: UITextField!
    
    @IBAction func clickLockSwitch(_ sender: UISwitch) {
        if(sender.isOn) {
            //screen lock
            SettingConst.setScreenLock(isLock: sender.isOn)
            LockTimeView.isHidden = false
            inputLockTime.text = String.init(Const.DEFAULT_SCREEN_LOCK_TIME)
        } else {
            //screen unlock
            SettingConst.setScreenLock(isLock: sender.isOn)
            LockTimeView.isHidden = true
        }
    }
    @IBAction func clickBtn(_ sender: UIButton) {
        let id = sender.restorationIdentifier
        switch id {
        case "password_change_btn":
            // password change popup
            let changePassword = self.storyboard?.instantiateViewController(withIdentifier: "changePassword")
//            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
//            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
//            changePassword?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            
            changePassword?.providesPresentationContextTransitionStyle = true
            changePassword?.definesPresentationContext = true
            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
            
            self.present(changePassword!, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = "setting".localized
        
        if(SettingConst.getScreenLock()) {
            LockTimeView.isHidden = false
            screenLock.isOn = true
        } else {
            LockTimeView.isHidden = true
            screenLock.isOn = false
        }
    }
}
