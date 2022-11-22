//
//  PharmacyDetailViewController.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import UIKit

class PharmacyDetailViewController: UIViewController {

    
    @IBOutlet weak var pharmacyDetailNameLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    let cityDataSource = CityDataSource()
    var pharmacyId: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pharmacyId = pharmacyId{
            cityDataSource.delegate = self
            cityDataSource.getPharmacyApi(pharmacyId: pharmacyId)
        }
            // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PharmacyDetailViewController: CityDataDelegate{
    func pharmacyDetailLoaded(pharmacyDetail: PharmacyDetail) {
        self.pharmacyDetailNameLabel.text = pharmacyDetail.Name
        self.addressLabel.text = pharmacyDetail.Address
        self.phoneNumberLabel.text = pharmacyDetail.Phone
    }
    
}
