//
//  YearModelViewModel.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 7/12/20.
//

import Foundation

class YearModelViewModel{
    
    var idBrand: String?
     var idModel: String?
    
    var apiManager = ApiManager()
    
    var arrayYearModel = [BaseClassAPI]()
    
    func getYearModel (onComplete: @escaping (Bool) -> Void)
    {
        if let idbrand = idBrand, let idModel = idModel{
            
            apiManager.loadData(path: "carros/marcas/\(idbrand)/modelos/\(idModel)/anos") { sucess in
                self.arrayYearModel = self.apiManager.arrayDate
                onComplete(true)
                return
            }
            
            onComplete(false)
            return
            
        }
       
    }
    
    func getArrayYearModel() -> [BaseClassAPI]{
        return arrayYearModel
    }
    
    func getYear(index: Int) -> String{
        
        return arrayYearModel[index].name
    }

    func getIdYear(index: Int) -> String{
        return arrayYearModel[index].id
    }
    
    func getIdBrand() -> String{
        return idBrand!
    }
}
