//
//  Book+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by 吴伟城 on 16/1/5.
//  Copyright © 2016年 cn-wu.cn. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Book {

    @NSManaged var title: String?
    @NSManaged var price: NSNumber?
    @NSManaged var yearPublished: NSNumber?
    @NSManaged var author: NSManagedObject?

}
