//
//  FinlandUserMapping.swift
//  MigrationCoreData
//
//  Created by Ruslan Filistovich on 13/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import Foundation
import CoreData

class FinlandUserMapping: NSEntityMigrationPolicy {
    
    override func createDestinationInstances(forSource sInstance: NSManagedObject, in mapping: NSEntityMapping, manager: NSMigrationManager) throws {
        if sInstance.entity.name == "InternationalUser" {
            let userName = sInstance.primitiveValue(forKey: "userName") as! String
            let userAge = sInstance.primitiveValue(forKey: "userAge") as! Int
            let userSex = sInstance.primitiveValue(forKey: "userSex") as! String
            let userCity = sInstance.primitiveValue(forKey: "userCity") as! String
            let userCountry = sInstance.primitiveValue(forKey: "userCountry") as! String
            
            if userCountry == "Finland" {
                let finelandUser = NSEntityDescription.insertNewObject(forEntityName: "FinlandUser", into: manager.destinationContext)
                finelandUser.setValue(userName, forKey: "userName")
                finelandUser.setValue(userAge, forKey: "userAge")
                finelandUser.setValue(userSex, forKey: "userSex")
                if userCity == "Vaasa" {
                    finelandUser.setValue("POMENENO", forKey: "userCity")
                } else {
                    finelandUser.setValue(userCity, forKey: "userCity")
                }
            }
        }
    }
    
}
