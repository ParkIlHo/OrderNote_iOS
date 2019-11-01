//
//  File.swift
//  ordernote
//
//  Created by 박일호 on 01/11/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit

protocol CustomerCellDelegate {
    func customerCellDelete(index: Int)
}

class CustomerTableCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var tel: UILabel!
    @IBOutlet weak var delete: UIButton!
    @IBOutlet weak var divider: UIView!
    
    var delegate: CustomerCellDelegate?
    var rowIndex: Int?
    
    @IBAction func click(_ sender: UIButton) {
        print("click delete!")
        
        if delegate == nil {
            return
        }
        
        delegate?.customerCellDelete(index: rowIndex!)
    }
}
