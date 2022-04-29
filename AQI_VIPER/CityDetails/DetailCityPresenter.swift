//
//  CityDetailsPresenter.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//

/*
 type: Object
 communication: protocol
 reference: view, interactor, router
 */

import UIKit


protocol AQIDetailsPresenter {
    var view: DetailCityAQIController? { get set }
    var router: DetailCityRouter? { get set }
    var interactor: DetailCityIneractor? {get set}
    
    func interactorDidfetchedData(with result: Result<[AQICityRecord], Error> )
}

class DetailCityPresenter: AQIDetailsPresenter {
    
    func interactorDidfetchedData(with result: Result<[AQICityRecord], Error>) {
        switch result {
        case .success(let models):
            
            
            var arr = [DataEntry]()
            let max = models.max{$0.aqi > $1.aqi}!
            
            for rec in models {
                let val = Float(rec.aqi / max.aqi) / 1.4
                let status = AQIStatus(rawValue: rec.status)!
                arr += [DataEntry(color: UIColor.forStatus(status), height: val, textValue: rec.aqiString!, title: String.asMinAndSec(rec.time!))]
            }
            
            DispatchQueue.main.async {
                self.view?.update(data: arr, model: models.first!.city!)
            }
            break
        default:
            break
        }
    }
    
    var view: DetailCityAQIController?
    var city: String!
    
    var interactor: DetailCityIneractor? {
        didSet { interactor?.getAQI(city: city) }
    }
    
    var router: DetailCityRouter?
    
    init(name: String) {
        city = name
    }
}
