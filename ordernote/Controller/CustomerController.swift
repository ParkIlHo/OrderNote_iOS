//
//  CustomerController.swift
//  ordernote
//
//  Created by 박일호 on 07/08/2019.
//  Copyright © 2019 박일호. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CustomerController: UIViewController, UITableViewDataSource, UITableViewDelegate, customerSaveDelegate, CustomerCellDelegate {
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    
    var customerList = [Customer]()
    
    // MARK: override
    override func viewDidLoad() {
        // Navigation bar 설정
        self.navigationController?.navigationBar.tintColor = .black
        self.navigationController?.navigationBar.topItem?.title = "title_customer".localized
        var rightBtnImage = UIImage(named: "add_customer")
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightBtnImage, style: .done, target: self, action: #selector(addCustomer))
        
        getCustomer()
        
        if customerList.count > 0 {
            emptyLabel.isHidden = true
            table.isHidden = false
        } else {
            emptyLabel.isHidden = false
            table.isHidden = true
        }
        
//        self.table.register(CustomerTableCell.self, forCellReuseIdentifier: "CustomerCell")
        table.separatorStyle = UITableViewCell.SeparatorStyle.none
//        table.estimatedRowHeight = 150
        table.dataSource = self
        table.delegate = self
    }
    
    // MARK: Add Customer View
    @objc func addCustomer() {
        print("click add Customer!!!!!")
        let addCustomer = self.storyboard?.instantiateViewController(withIdentifier: "AddCustomer") as! AddCustomerController
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overFullScreen
        //            changePassword?.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        //            changePassword?.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
                    
        addCustomer.providesPresentationContextTransitionStyle = true
        addCustomer.definesPresentationContext = true
        addCustomer.modalPresentationStyle = UIModalPresentationStyle.overCurrentContext
        
        addCustomer.delegate = self
                    
        self.present(addCustomer, animated: true, completion: nil)
    }
    
    // MARK: customerSaveDelegate
    func saveCustomer(data: Bool) {
        print("customerSaveDelegate save is = ", data)
        if(data) {
            emptyLabel.isHidden = true
            table.isHidden = false
            
            getCustomer()
            
            table.reloadData()
        }
    }
    
    // MARK:
    func customerCellDelete(index: Int) {
        let customer = self.customerList[index] as Customer
        showAlert(title: "주문자 삭제", msg: "이름 = \(customer.name ?? "")\n 전화번호 = \(customer.tel ?? "")\n 삭제 하시겠습니까?",
            confirmBtnString: "delete".localized,
            cancelBtnString: "cancel".localized,
            confirmHandler: { Void in
                self.deleteCustomer(index: index)
                if(self.customerList.count > 0) {
                    self.table.reloadData()
                } else {
                    self.emptyLabel.isHidden = false
                    self.table.isHidden = true
                }
                
        },
            cancelHandler: nil)
    }
    
    // MARL: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        customerList.count
    }
    
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomerTableCell = tableView.dequeueReusableCell(withIdentifier: "CustomerCell", for: indexPath) as! CustomerTableCell
        
        let customer = customerList[indexPath.row]
        
        if(indexPath.row == 0) {
            cell.divider.isHidden = true
        }
        cell.name?.text = customer.name
        cell.tel?.text = customer.tel
        cell.rowIndex = indexPath.row
        cell.delegate = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func getCustomer() {
        customerList.removeAll()
        let req = NSFetchRequest<Customer>(entityName: "Customer")
        
        if let fetchResult = (try? managedObjectContext.fetch(req)) as? [NSManagedObject] {
            if fetchResult.count > 0 {
                for customer in fetchResult {
                    let cus = customer as! Customer
                    customerList.append(cus)
                }
            }
        }
    }
    
    func deleteCustomer(index: Int) {
        managedObjectContext.delete(customerList[index])
        customerList.remove(at: index)
    }
    
}
