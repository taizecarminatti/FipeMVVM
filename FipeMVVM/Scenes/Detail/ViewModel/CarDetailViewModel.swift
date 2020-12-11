//
//  CarDetailViewModel.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 2/12/20.
//

import Foundation

class CarDetailViewModel {
    
    var idBrand: String?
    var idModel: String?
    var idCarYear: String?
    
    
    var apiManager = ApiManager()
    
    var carDetail: CarDetail?
    
    func getCarDetail (onComplete: @escaping (Bool) -> Void)
    {
        if let idbrand = idBrand , let idModel = idModel, let idCarYear = idCarYear{
            apiManager.loadDataCarDetail (path: "/carros/marcas/\(idbrand)/modelos/\(idModel)/anos/\(idCarYear)") { sucess in
                
                self.carDetail = self.apiManager.carDetail
                onComplete(true)
                return
            }
            
            onComplete(false)
            return
        }
        
    }
    
   
    
    func getCarModel() -> String{
        return "MODELO:\((carDetail?.modelo)!)"
    }
    
    func getCarBrand() -> String{
        return "MARCA:\((carDetail?.marca)!)"
    }
    
    func getCarYear() -> String{
        return String("ANO: \((carDetail?.anoModelo)!)")
    }
    
    func getCarValue() -> String{
        return "R$: \((carDetail?.valor)!)"
    }
    
}
    
    

