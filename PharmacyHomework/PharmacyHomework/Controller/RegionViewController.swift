//
//  CityDetailViewController.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import UIKit

class RegionViewController: UIViewController {
    
    let cityDataSource = CityDataSource()
    
    @IBOutlet weak var regionTableView: UITableView!
    var cityId: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Regions"
        if let cityId = cityId{
            cityDataSource.getListOfRegions(cityId: cityId)
        }
        cityDataSource.delegate = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if
            let cell = sender as? RegionTableViewCell,
            let pharmacyViewController = segue.destination as? PharmacyViewController
        {
            pharmacyViewController.pharmacyId = cell.regionId
        }
    }
    

}

extension RegionViewController: CityDataDelegate{
    func regionListLoaded() {
        self.regionTableView.reloadData()
    }
}

extension RegionViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityDataSource.getNumberOfRegion()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell") as? RegionTableViewCell
        else  {
            return UITableViewCell()
        }
        
       if let region = cityDataSource.getRegion(for: indexPath.row) {
           cell.regionNameLabel.text = region.Name
           cell.regionId = region.Id
        } else {
            cell.regionNameLabel.text = ""
        }
        return cell
    }
    
}

