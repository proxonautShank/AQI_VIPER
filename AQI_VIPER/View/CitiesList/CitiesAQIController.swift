//
//  CitiesAIQController.swift
//  freshBreath
//
//  Created by Shashank Pali on 12/02/22.
//

import UIKit


final class CitiesAQIController: UITableViewController, UISearchResultsUpdating {
    
//    let viewModel = CitiesAQIViewModel()
    var citiesModel = [CityModel]()
    var dataSource = [CityModel]()
    var searchText : String?
    
    private lazy var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Looking for specific city..."
        
        return search
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearch()
        setupTable()
        setupModel()
    }
    
    private func setupSearch() {
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    private func setupTable() {
        tableView.register(UINib(nibName: "CityAQICell", bundle: nil), forCellReuseIdentifier: "CityAQICell")
        tableView.rowHeight = 156
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
    private func setupModel() {
//        viewModel.delegate = self
//        viewModel.requestForData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
//        return dataSource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CityAQICell", for: indexPath) as! CityAQICell
//        cell.prepare(forModel: dataSource[indexPath.row])
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailCityAQIController(nibName: "DetailCityAQIController", bundle: nil)
//        detail.cityModel = dataSource[indexPath.row]
        detail.modalPresentationStyle = .overCurrentContext
        self.navigationController?.present( detail, animated: true, completion: nil)
    }

    // MARK: - Search Results Updating
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text?.count != 0 {
            searchText = searchController.searchBar.text ?? ""
            reloadTable()
        }else {
            searchText = nil
            reloadTable()
        }
        
    }
   
    
    private func reloadTable() {
        if let text = searchText {
//            dataSource = citiesModel.filter{$0.name.contains(text)}
        }else {
            dataSource = citiesModel
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}

//extension CitiesAQIController: CitiesAQIViewModelDelegate {
//    func didUpdated(citiesAQI: [CityModel]) {
//        citiesModel = citiesAQI
//        reloadTable()
//    }
//}
