//
//  CitiesListRouterTest.swift
//  AQI_VIPERTests
//
//  Created by Shashank Pali on 02/05/22.
//

import XCTest
@testable import AQI_VIPER

class CitiesListInteractorTest: XCTestCase {
    
    var interactor: CitiesListInteractor!
    
    override func setUp() {
        interactor = CitiesListInteractor.init(webSocket: WebSocket.init(connectionString: "ws://city-ws.herokuapp.com/"))
        
        super.setUp()
    }

    override func tearDown() {
        interactor = nil
        super.tearDown()
    }
    
    //MARK: - Async Test
    
    private var result: String?
    private var expectation: XCTestExpectation?
    
    func testResponse() throws {
        interactor.webSocket?.delegate = self
        expectation = expectation(description: "response")
        waitForExpectations(timeout: 10)
        XCTAssertNotNil(self.result)
    }
}

extension CitiesListInteractorTest: WebSocketDelegate {
    func didReceive(response: String) {
        result = response
        expectation?.fulfill()
    }
}
