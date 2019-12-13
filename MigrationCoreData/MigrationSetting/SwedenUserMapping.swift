//
//  SwedenUserMapping.swift
//  MigrationCoreData
//
//  Created by Ruslan Filistovich on 13/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation
import CoreData

class SwedenUserMapping: NSEntityMigrationPolicy {
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        if sInstance.entity.name == "InternationalUser" {
            let userName = sInstance.primitiveValue(forKey: "userName") as? String
            let userAge = sInstance.primitiveValue(forKey: "userAge") as? Int
            let userSex = sInstance.primitiveValue(forKey: "userSex") as? String
            let userCity = sInstance.primitiveValue(forKey: "userCity") as? String
            let userCountry = sInstance.primitiveValue(forKey: "userCountry") as? String
            
            if userCountry == "Sweden" {
                let swedenUser = NSEntityDescription.insertNewObject(forEntityName: "ShwedenUser", into: manager.destinationContext)
                swedenUser.setValue(userName, forKey: "userName")
                swedenUser.setValue(userAge, forKey: "userAge")
                swedenUser.setValue(userSex, forKey: "userSex")
                if userCity == "Trosa" {
                    swedenUser.setValue("POMENENO", forKey: "userCity")
                } else {
                    swedenUser.setValue(userCity, forKey: "userCity")
                }
            }
        }
    }
}
