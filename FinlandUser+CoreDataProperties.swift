//
//  FinlandUser+CoreDataProperties.swift
//  MigrationCoreData
//
//  Created by Ruslan Filistovich on 13/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension FinlandUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FinlandUser> {
        return NSFetchRequest<FinlandUser>(entityName: "FinlandUser")
    }

    @NSManaged public var userAge: Int16
    @NSManaged public var userCity: String?
    @NSManaged public var userName: String?
    @NSManaged public var userSex: String?

}
