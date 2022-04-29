//
//  AQICityRecord+CoreDataProperties.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//
//

import Foundation
import CoreData


extension AQICityRecord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AQICityRecord> {
        return NSFetchRequest<AQICityRecord>(entityName: "AQICityRecord")
    }

    @NSManaged public var aqi: Double
    @NSManaged public var aqiString: String?
    @NSManaged public var time: Date?
    @NSManaged public var status: Int16
    @NSManaged public var city: CityModel?

}

extension AQICityRecord : Identifiable {

}
