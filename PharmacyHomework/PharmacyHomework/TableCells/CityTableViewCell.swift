//
//  CityTableViewCell.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import UIKit

class CityTableViewCell: UITableViewCell {

    
    @IBOutlet weak var cityNameLabel: UILabel!
    var cityId: Int?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}


