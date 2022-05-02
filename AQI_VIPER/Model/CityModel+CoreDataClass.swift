//
//  CityModel+CoreDataClass.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//
//

import Foundation
import CoreData


public class CityModel: NSManagedObject {
    
    static func store(city name: String, record: AQICityRecord, stack: CoreDataStack) {
        
        let context = stack.managedContext
        
        if let cit = getModel(name: name, context: context) {
            cit.addToRecords(record)
        }else {
            let city = NSEntityDescription.insertNewObject(forEntityName: "CityModel", into: context) as? CityModel
            city?.name = name
            city?.addToRecords(record)
        }
        
        stack.saveContext()
    }
    
    static func getModel(name: String, context: NSManagedObjectContext) -> CityModel? {
        let req = CityModel.fetchRequest()
        req.predicate = NSPredicate(format: "name = %@", name)
        
        return try? context.fetch(req).first
    }
    
    static func getRecords(city: String, context: NSManagedObjectContext) -> NSSet? {
        let req = CityModel.fetchRequest()
        req.predicate = NSPredicate(format: "name = %@", city)
        
        return try? context.fetch(req).first?.records
    }
    
    static func getModels(context: NSManagedObjectContext) -> [CityModel]? {
        let req = CityModel.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        return try? context.fetch(req)
    }
    
}
