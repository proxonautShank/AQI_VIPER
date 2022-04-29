//
//  DetailCityAQIController.swift
//  freshBreath
//
//  Created by Shashank Pali on 29/04/22.
//

/*
 type: UIViewController
 communication: protocol
 reference: presenter
 */

protocol AQIDetailsView {
    var presenter: DetailCityPresenter? { get set }
    func update(data: [DataEntry], model: CityModel)
}

import UIKit

final class DetailCityAQIController: UIViewController {

    var presenter: DetailCityPresenter?
        
    @IBOutlet weak var cityView: AQIView!
    @IBOutlet weak var chartView: BasicBarChart!
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func hideTapped(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func timerSelected(_ sender: UISegmentedControl) {
        //        viewModel.getUpdate(inSeconds: [0 : 5.0, 1 : 30.0, 2 : 60.0][sender.selectedSegmentIndex], fromUI: true)
    }
}

extension DetailCityAQIController: AQIDetailsView {
    func update(data: [DataEntry], model: CityModel) {
        cityView.prepare(forModel: model)
        chartView.updateDataEntries(dataEntries: data, animated: true, scrollToNew: true)
    }
}
