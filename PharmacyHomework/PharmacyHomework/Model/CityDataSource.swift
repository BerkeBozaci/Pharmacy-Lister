//
//  CityDataSource.swift
//  PharmacyHomework
//
//  Created by Berke Bozacı on 22.11.2022.
//

import Foundation

class CityDataSource{
    
    private var cityArray: [City] = []
    private var regionArray: [CityRegion] = []
    private var pharmacyArray: [Pharmacy] = []
    
    private let baseURL = "https://koc.api.staging.tarentum.io"
    var delegate: CityDataDelegate?
    
    init(){
    }
    
    
    func getListOfCities(){
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/city") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    self.cityArray = try! decoder.decode([City].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.cityListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }

    func getNumberOfCity() -> Int {
        return cityArray.count
    }
    
    func getCity(for index:Int) -> City? {
        guard index < cityArray.count else {
            return nil
        }
        
        return cityArray[index]
    }
    
    
    func getListOfRegions(cityId: Int){
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/city/\(cityId)/region") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    self.regionArray = try! decoder.decode([CityRegion].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.regionListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    func getNumberOfRegion() -> Int {
        return regionArray.count
    }
    
    func getRegion(for index:Int) -> CityRegion? {
        guard index < regionArray.count else {
            return nil
        }
        
        return regionArray[index]
    }
    
    func getListOfPharmacies(pharmacyId: String){
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/region/\(pharmacyId)/pharmacy") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    self.pharmacyArray = try! decoder.decode([Pharmacy].self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyListLoaded()
                    }
                }
            }
            dataTask.resume()
        }
    }
    func getNumberOfPharmacy() -> Int {
        return pharmacyArray.count
    }
    
    func getPharmacy(for index:Int) -> Pharmacy? {
        guard index < pharmacyArray.count else {
            return nil
        }
        
        return pharmacyArray[index]
    }
    
    func getPharmacyApi(pharmacyId: String){
        print(pharmacyId)
        let session = URLSession.shared
        if let url = URL(string: "\(baseURL)/pharmacy/\(pharmacyId)") {
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    let pharmacyDetail: PharmacyDetail = try! decoder.decode(PharmacyDetail.self, from: data)
                    DispatchQueue.main.async {
                        self.delegate?.pharmacyDetailLoaded(pharmacyDetail: pharmacyDetail)
                    }
                }
            }
            dataTask.resume()
        }
    }
}
