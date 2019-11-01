//
//  Customer+CoreDataProperties.swift
//  ordernote
//
//  Created by 박일호 on 31/10/2019.
//  Copyright © 2019 박일호. All rights reserved.
//
//

import Foundation
import CoreData


extension Customer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Customer> {
        return NSFetchRequest<Customer>(entityName: "Customer")
    }

    @NSManaged public var email: String?
    @NSManaged public var index: Int64
    @NSManaged public var name: String!
    @NSManaged public var other: String?
    @NSManaged public var tel: String!

}
