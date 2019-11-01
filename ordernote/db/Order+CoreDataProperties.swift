//
//  Order+CoreDataProperties.swift
//  ordernote
//
//  Created by 박일호 on 31/10/2019.
//  Copyright © 2019 박일호. All rights reserved.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var account_name: String?
    @NSManaged public var coast_price: Int64
    @NSManaged public var color: String?
    @NSManaged public var content: Int16
    @NSManaged public var content_other: String?
    @NSManaged public var email: String?
    @NSManaged public var index: Int64
    @NSManaged public var mobile: String?
    @NSManaged public var name: String?
    @NSManaged public var order_date: Date?
    @NSManaged public var other: String?
    @NSManaged public var product_image: String?
    @NSManaged public var product_name: String?
    @NSManaged public var promise_date: Date?
    @NSManaged public var release_schedule: Date?
    @NSManaged public var release_yn: Bool
    @NSManaged public var selling_price: Int64
    @NSManaged public var shipping_address: String?
    @NSManaged public var size: String?
    @NSManaged public var tel: String?
    @NSManaged public var transform: String?

}
