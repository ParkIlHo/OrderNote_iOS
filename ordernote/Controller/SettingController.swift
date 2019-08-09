//
//  SettingController.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import UIKit

class SettingController: UIViewController {
    override func viewDidLoad() {
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = "setting".localized
    }
}
