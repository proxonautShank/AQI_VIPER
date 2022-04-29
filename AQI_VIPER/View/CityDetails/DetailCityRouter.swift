//
//  CityDetailsRouter.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//

/*
 type: Object
 communication: protocol
 reference: view
 */

import UIKit

protocol AQIDetailsRouter {
    var entry: DetailCityAQIController? { get set }
    static func start(city: String) -> AQIDetailsRouter
}

class DetailCityRouter: AQIDetailsRouter {
    var entry: DetailCityAQIController?
    
    static func start(city: String) -> AQIDetailsRouter {
        
        let router = DetailCityRouter()
        
//        Assign VIP
        let view = DetailCityAQIController(nibName: "DetailCityAQIController", bundle: nil) 
        let interactor = DetailCityIneractor()
        let presenter = DetailCityPresenter.init(name: city)
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = view
        
        return router
    }
}
