//
//  InternationalUser+CoreDataProperties.swift
//  MigrationCoreData
//
//  Created by Ruslan Filistovich on 13/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//
//

import Foundation
import CoreData


extension InternationalUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InternationalUser> {
        return NSFetchRequest<InternationalUser>(entityName: "InternationalUser")
    }

    @NSManaged public var userName: String?
    @NSManaged public var userAge: Int16
    @NSManaged public var userCountry: String?
    @NSManaged public var userSex: String?
    @NSManaged public var userCity: String?
    

}
