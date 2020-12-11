//
//  ApiManager.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 1/12/20.
//

import UIKit
import Alamofire


class ApiManager {
    
    var carDetail: CarDetail?
    var arrayDate = [BaseClassAPI]()
    
    var apiBaseUrl = "https://parallelum.com.br/fipe/api/v1"
    
    func loadData(path: String , onComplete: @escaping (Bool) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [[String: Any]] {
                    var brands = [BaseClassAPI]()
                    for item in json {
                        brands.append(BaseClassAPI(fromDictionary: item))
                    }
                    self.arrayDate = brands
                    onComplete(true)
                    return
                }
                onComplete(false)
            }
        }
    
    
    func loadDataModel(path: String , onComplete: @escaping (Bool) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [String: Any], let jsonModels = json["modelos"] as? [[String:Any]] {
                    var models = [BaseClassAPI]()
                    for item in jsonModels {
                        models.append(BaseClassAPI(fromDictionary: item))
                    }
                    self.arrayDate = models
                    onComplete(true)
                    return
                }
                onComplete(false)
            }
        }
    func loadDataCarDetail(path: String , onComplete: @escaping (Bool) -> Void) {
            AF.request("\(apiBaseUrl)/\(path)").responseJSON { response in
                if let json = response.value as? [String: Any] {
                    print(json)
                    let carDetail = CarDetail(fromDictionary: json)
                    
                    self.carDetail = carDetail
//
                    onComplete(true)
                    return
                }
                onComplete(false)
            }
        }
    
    
}

