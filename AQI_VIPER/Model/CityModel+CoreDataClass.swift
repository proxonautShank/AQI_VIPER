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
    
    static func store(city name: String, record: AQICityRecord) {
        
        let context = CoreDataStack.shared.managedContext
                
        if let cit = getModel(name: name) {
            cit.addToRecords(record)
        }else {
            let city = NSEntityDescription.insertNewObject(forEntityName: "CityModel", into: context) as? CityModel
            city?.name = name
            city?.addToRecords(record)
        }
        
        CoreDataStack.shared.saveContext()
    }
    
    static func getModel(name: String) -> CityModel? {
        let req = CityModel.fetchRequest()
        req.predicate = NSPredicate(format: "name = %@", name)
        
        return try? CoreDataStack.shared.managedContext.fetch(req).first
    }
    
    static func getRecords(city: String) -> NSSet? {
        let req = CityModel.fetchRequest()
        req.predicate = NSPredicate(format: "name = %@", city)
        
        return try? CoreDataStack.shared.managedContext.fetch(req).first?.records
    }
    
    static func getModels() -> [CityModel]? {
        let req = CityModel.fetchRequest()
        req.sortDescriptors = [NSSortDescriptor.init(key: "name", ascending: true)]
        
        return try? CoreDataStack.shared.managedContext.fetch(req)
    }
    
}
