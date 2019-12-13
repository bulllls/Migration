//
//  ViewController.swift
//  MigrationCoreData
//
//  Created by Ruslan Filistovich on 13/12/2019.
//  Copyright © 2019 Ruslan Filistovich. All rights reserved.
//

import UIKit
import CoreData

class UserViewController: UIViewController {

    @IBOutlet weak var userTableView: UITableView!
    var dataSource = [UserModel]()
    
    lazy var frc: NSFetchedResultsController<FinlandUser> = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { fatalError() }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<FinlandUser>(entityName: "FinlandUser")
        let descriptor = NSSortDescriptor(key: "userName", ascending: true)
        request.sortDescriptors = [descriptor]
        let controller = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        return controller
    }()
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      try? frc.performFetch()
        print("Will")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //insertIntitialData()
        frc.delegate = self
        userTableView.delegate = self
        userTableView.dataSource = self
        
    }
    
    func insertIntitialData() {

        let userOne = InternationalUser(context: frc.managedObjectContext)
        userOne.setValue("Alice", forKey: "userName")
        userOne.setValue("Finland", forKey: "userCountry")
        userOne.setValue("Female", forKey: "userSex")
        userOne.setValue(22, forKey: "userAge")
        userOne.setValue("Hanko", forKey: "userCity")
        
        let userTwo = InternationalUser(context: frc.managedObjectContext)
        userTwo.setValue("Mark", forKey: "userName")
        userTwo.setValue("Sweden", forKey: "userCountry")
        userTwo.setValue("Male", forKey: "userSex")
        userTwo.setValue(24, forKey: "userAge")
        userTwo.setValue("Flen", forKey: "userCity")
        
        let userThree = InternationalUser(context: frc.managedObjectContext)
        userThree.setValue("Perry", forKey: "userName")
        userThree.setValue("Finland", forKey: "userCountry")
        userThree.setValue("Female", forKey: "userSex")
        userThree.setValue(24, forKey: "userAge")
        userThree.setValue("Rauma", forKey: "userCity")
        
        let userFour = InternationalUser(context: frc.managedObjectContext)
        userFour.setValue("Alan", forKey: "userName")
        userFour.setValue("Sweden", forKey: "userCountry")
        userFour.setValue("Male", forKey: "userSex")
        userFour.setValue(21, forKey: "userAge")
        userFour.setValue("Trosa", forKey: "userCity")
        
        let userFive = InternationalUser(context: frc.managedObjectContext)
        userFive.setValue("Baker", forKey: "userName")
        userFive.setValue("Finland", forKey: "userCountry")
        userFive.setValue("Female", forKey: "userSex")
        userFive.setValue(25, forKey: "userAge")
        userFive.setValue("Vaasa", forKey: "userCity")
        
        try? frc.managedObjectContext.save()
        
    }
    
}



extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return frc.sections?[section].numberOfObjects ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserTableViewCell
        cell?.lblName.text = frc.object(at: indexPath).userName
        //cell?.lblCountry.text = frc.object(at: indexPath).userCountry
        cell?.lblCity.text = frc.object(at: indexPath).userCity
        
//        switch frc.object(at: indexPath).userCountry {
//            case "Sweden":
//                cell?.imgCtryFlag?.image = UIImage(named: "SwedenFlag")
//            default:
//                cell?.imgCtryFlag?.image = UIImage(named: "FinlandFlag")
//        }
        return cell ?? UITableViewCell()
    }
    
    
}

extension UserViewController: NSFetchedResultsControllerDelegate {
  func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    userTableView.beginUpdates()
  }
  
  func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
    switch type {
    case .insert:
      userTableView.insertRows(at: [indexPath ?? newIndexPath ?? IndexPath(row: 0, section: 0)], with: .fade)
    case .delete:
      userTableView.deleteRows(at: [indexPath!], with: .fade)
    case .move:
      userTableView.moveRow(at: indexPath!, to: newIndexPath!)
    case .update:
      userTableView.reloadRows(at: [indexPath!], with: .fade)
    @unknown default:
        fatalError()
    }
  }
  
  func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
    userTableView.endUpdates()
  }
  
}
