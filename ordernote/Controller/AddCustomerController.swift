//
//  AddCustomerController.swift
//  ordernote
//
//  Created by 박일호 on 16/09/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit
import CoreData

protocol customerSaveDelegate {
    func saveCustomer(data: Bool)
}

class AddCustomerController: UIViewController {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var tel: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var other: UITextView!
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var save: UIButton!
    @IBAction func click(_ sender: UIButton) {
        let id = sender.restorationIdentifier
        
        switch id {
        case "cancel":
            clickCancel()
        case "save":
            clickSave()
        default:
            print("default")
        }
    }
    
    var delegate : customerSaveDelegate?
    
    override func viewDidLoad() {
        name.addDoneButtonToKeyBoard(myAction: #selector(self.name.resignFirstResponder))
        tel.addDoneButtonToKeyBoard(myAction: #selector(self.tel.resignFirstResponder))
        email.addDoneButtonToKeyBoard(myAction: #selector(self.email.resignFirstResponder))
    }
    
    func clickCancel() {
        print("click calcel!!!")
        self.delegate?.saveCustomer(data: false)
        self.dismiss(animated: true, completion: nil)
    }
		    
    func clickSave() {
        print("click save!!!!")
        if(name.text!.isEmpty || tel.text!.isEmpty) { // 필수 입력사항이 입력되어 있지 않을 경우
            showToast(message: "add_customer_require_check".localized)
        } else {
            let nameStr = name.text
            let telStr = tel.text
            let emailStr = email.text
            let otherStr = other.text
            
            let req = NSFetchRequest<Customer>(entityName: "Customer")
            req.predicate = NSPredicate(format: "name = %@ or tel = %@", nameStr!, telStr!)
            
            let fetchResult = (try? managedObjectContext.fetch(req)) as? [NSManagedObject]
            
            if(fetchResult != nil && fetchResult!.count > 0) {
                showToast(message: "동일 이름 / 전화번호가 이미 있습니다.")
                return
            }
            
            print("save cutomer!!")
            let customer = NSEntityDescription.insertNewObject(forEntityName: "Customer", into: managedObjectContext) as! Customer
            
            customer.name = nameStr
            customer.tel = telStr
            customer.email = emailStr
            customer.other = otherStr
            
            self.delegate?.saveCustomer(data: true)
            self.dismiss(animated: true, completion: nil)
            
            
//            managedObjectContext.insert(customer)
            
            
//            customer.addToCustomer(customer)
        }
    }
}
