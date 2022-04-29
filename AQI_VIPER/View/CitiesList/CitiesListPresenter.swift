//
//  CitiesListPresenter.swift
//  AQI_VIPER
//
//  Created by Shashank Pali on 29/04/22.
//

/*
 type: Object
 communication: protocol
 reference: interactor, router, view
 */

import Foundation

protocol AQIPresenter {
    var view: CitiesAQIController? {get set}
    var interactor: CitiesListInteractor? {get set}
    var router: CitiesListRouter? {get set}
    
    func interactorDidfetchedData(with result: Result<Any, Error> )
}

class CitiesListPresenter: AQIPresenter {
    
    var interactor: CitiesListInteractor? {
        didSet { interactor?.getAQIData() }
    }
    var router: CitiesListRouter?
    var view: CitiesAQIController?
        
    func interactorDidfetchedData(with result: Result<Any, Error>) {
        
        switch result {
        case .success(let models):
            DispatchQueue.main.async {
                self.view?.update(data: models)
            }
            break
        case .failure(let error):
            view?.showErrorMsg(error: error)
            break
        }
    }
    
}
