//
//  ViewController.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var cityTableView: UITableView!
    
    private var cityDataSource = CityDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Cities"
        cityDataSource.delegate = self
        cityDataSource.getListOfCities()
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if
            let cell = sender as? UITableViewCell,
            let indexPath = cityTableView.indexPath(for: cell),
            let city = cityDataSource.getCity(for: indexPath.row),
            let cityDetailViewController = segue.destination as? RegionViewController
        {
            cityDetailViewController.cityId = city.Id
        }
    }
}

extension MainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cityDataSource.getNumberOfCity()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell") as? CityTableViewCell
        else  {
            return UITableViewCell()
        }
        
       if let city = cityDataSource.getCity(for: indexPath.row) {
           cell.cityNameLabel.text = city.Name
           cell.cityId = city.Id
        } else {
            cell.cityNameLabel.text = ""
        }
        return cell
    }
}


extension MainViewController: CityDataDelegate{
    func cityListLoaded() {
        self.cityTableView.reloadData()
    }
}
