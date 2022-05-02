//
//  CitiesListInteractor.swift
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

protocol AQIInteractor {
    var presenter: CitiesListPresenter? {get set}
    var webSocket: WebSocket? {get set}
    func getAQIData()
}


class CitiesListInteractor: AQIInteractor {
    
    var presenter: CitiesListPresenter?
    var webSocket: WebSocket?
    
    init(webSocket: WebSocket) {
        self.webSocket = webSocket
    }
    
    func getAQIData() {
        fetchDataFromLocal()
        webSocket?.delegate = self
    }
    
    private func fetchDataFromLocal() {
        guard let models = CityModel.getModels(context: CoreDataStack.shared.managedContext) else {return}
        presenter?.interactorDidfetchedData(with: .success(models))
    }
}

extension CitiesListInteractor: WebSocketDelegate {
    func didReceive(response: String) {
        guard let data = response.data(using: .utf8) else { return }
        do {
            let responseArray = try JSONDecoder().decode([AQIEntity].self, from: data)
            prepareCitiesAQI(responseArray)
        } catch {
            presenter?.interactorDidfetchedData(with: .failure(error))
        }
    }
}

extension CitiesListInteractor {
    
    private func prepareCitiesAQI(_ res: [AQIEntity]) {
        let stack = CoreDataStack.shared
        for model in res {
            guard let record = AQICityRecord.store(aqiRecord: model.aqi, stack: stack) else {continue}
            CityModel.store(city: model.city, record: record, stack: stack)
        }
        fetchDataFromLocal()
    }
}

#if DEBUG
extension CitiesListInteractor {
    public func exposePrivateFetch() {
        return fetchDataFromLocal()
    }
}
#endif
