//
//  CitiesListRouter.swift
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

protocol AQIRouter {
    var entry : UINavigationController? { get } // view
    static func start() -> AQIRouter?
}

class CitiesListRouter: AQIRouter {
    var entry: UINavigationController?
    
    static func start() -> AQIRouter? {
        
        let router = CitiesListRouter()
        
        // Assign VIP
        let navCont = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "AQINavController")
        
        guard let view = navCont.children.first as? CitiesAQIController else { return nil }
        
        let interactor = CitiesListInteractor.init(webSocket: WebSocket.init(connectionString: "ws://city-ws.herokuapp.com/"))
        
        let presenter = CitiesListPresenter()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        router.entry = navCont as? UINavigationController
        
        return router
    }
}
