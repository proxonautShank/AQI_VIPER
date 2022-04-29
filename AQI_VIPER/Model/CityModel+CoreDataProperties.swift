//
//  CityModel+CoreDataProperties.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//
//

import Foundation
import CoreData


extension CityModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CityModel> {
        return NSFetchRequest<CityModel>(entityName: "CityModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var records: NSSet?

}

// MARK: Generated accessors for records
extension CityModel {

    @objc(addRecordsObject:)
    @NSManaged public func addToRecords(_ value: AQICityRecord)

    @objc(removeRecordsObject:)
    @NSManaged public func removeFromRecords(_ value: AQICityRecord)

    @objc(addRecords:)
    @NSManaged public func addToRecords(_ values: NSSet)

    @objc(removeRecords:)
    @NSManaged public func removeFromRecords(_ values: NSSet)

}

extension CityModel : Identifiable {

}
