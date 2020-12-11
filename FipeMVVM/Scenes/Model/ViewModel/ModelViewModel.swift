//
//  ModelViewModel.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 7/12/20.
//

import Foundation

class ModelViewModel{
    
    var id: String?
    
    var apiManager = ApiManager()
    
    var arrayModel = [BaseClassAPI]()
    
    func getModel (onComplete: @escaping (Bool) -> Void)
    {
        
        if let id = id{
            apiManager.loadDataModel(path:"carros/marcas/\(id)/modelos") { sucess in
                self.arrayModel = self.apiManager.arrayDate
                onComplete(true)
                return
            }
        }
      
        
        onComplete(false)
        return
    }
    
    func getArrayModel() -> [BaseClassAPI]{
        return arrayModel
    }
    
    func getNameModel(index: Int) -> String{
        
        return arrayModel[index].name
    }
    
    func getIdModel(index: Int) -> String{
        return arrayModel[index].id
    }
    
    
}
