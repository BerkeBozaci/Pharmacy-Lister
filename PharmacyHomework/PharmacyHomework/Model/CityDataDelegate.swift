//
//  CityDataDelegate.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import Foundation

protocol CityDataDelegate{
    
    func cityListLoaded()
    func regionListLoaded()
    func pharmacyListLoaded()
    
    func pharmacyDetailLoaded(pharmacyDetail: PharmacyDetail)
}

extension CityDataDelegate {
    
    func cityListLoaded() {}
    func regionListLoaded() {}
    func pharmacyListLoaded() {}

    func pharmacyDetailLoaded(pharmacyDetail: PharmacyDetail) {}
}
