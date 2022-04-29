//
//  DetailCityIneractor.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//

/*
 type: Object
 communication: protocol
 reference: presenter
 */

import Foundation

protocol AQIDetailsInteractor {
    var presenter: DetailCityPresenter? {get set}
    func getAQI(city: String)
}

class DetailCityIneractor: AQIDetailsInteractor {
    
    var presenter: DetailCityPresenter?
    
    func getAQI(city: String) {
        let records = (CityModel.getRecords(city: city)?.allObjects as? [AQICityRecord])!
        presenter?.interactorDidfetchedData(with: .success(records))
    }
}
