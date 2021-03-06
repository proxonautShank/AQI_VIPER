//
//  AQICityRecord+CoreDataClass.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//
//

import Foundation
import CoreData


public class AQICityRecord: NSManagedObject {
    
    static func store(aqiRecord: Double, stack: CoreDataStack) -> AQICityRecord? {
        
        guard let record = NSEntityDescription.insertNewObject(forEntityName: "AQICityRecord", into: stack.managedContext) as? AQICityRecord else {return nil}
        record.aqi = aqiRecord
        record.aqiString = String(format: "%.2f", aqiRecord)
        record.time = Date()
        record.status = AQIStatus.status(forAQI: aqiRecord).rawValue
        
        stack.saveContext()
        
        return record
    }
}
