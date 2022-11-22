//
//  PharmacyViewController.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import UIKit

class PharmacyViewController: UIViewController {

    let cityDataSource = CityDataSource()
    var pharmacyId: String?
    
    @IBOutlet weak var pharmacyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Pharmacies"
        if let pharmacyId = pharmacyId{
            cityDataSource.getListOfPharmacies(pharmacyId: pharmacyId)
        }
        cityDataSource.delegate = self
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if
            let cell = sender as? PharmacyTableViewCell,
            let pharmacyDetailViewController = segue.destination as? PharmacyDetailViewController
        {
            pharmacyDetailViewController.pharmacyId = cell.pharmacyId
        }
    }
    

}

extension PharmacyViewController: CityDataDelegate{
    func pharmacyListLoaded() {
        self.pharmacyTableView.reloadData()
    }
}

extension PharmacyViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityDataSource.getNumberOfPharmacy()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell") as? PharmacyTableViewCell
        else  {
            return UITableViewCell()
        }
        
       if let pharmacy = cityDataSource.getPharmacy(for: indexPath.row) {
           cell.pharmacyNameLabel.text = pharmacy.Name
           cell.pharmacyId = pharmacy.Id
        } else {
            cell.pharmacyNameLabel.text = ""
        }
        return cell
    }
    
}


