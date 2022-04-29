//
//  CoreDataStack.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//

import Foundation
import CoreData


class CoreDataStack {
    
    // MARK: - Core Data stack
    
    static let shared = CoreDataStack()
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "AQI_VIPER")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var managedContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = managedContext
        context.performAndWait {
            do {
                if context.hasChanges {
                    try context.save()
                }
            }catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
