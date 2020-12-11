//
//  BrandViewModel.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 1/12/20.
//

import UIKit

class BrandViewModel {
    
    var apiManager = ApiManager()
    
    var arrayBrand = [BaseClassAPI]()
    
    func getBrand (onComplete: @escaping (Bool) -> Void) {
        apiManager.loadData(path: "carros/marcas") { sucess in
            self.arrayBrand = self.apiManager.arrayDate
            onComplete(true)
            return
        }
        
        onComplete(false)
        return
    }
    
    func getArrayBrand() -> [BaseClassAPI]{
        return arrayBrand
    }
    
    func getNameBrand(index: Int) -> String{
        
        return arrayBrand[index].name
    }
    
    func openScreenModel(storyBoard:String, nameViewController: UIViewController){
      
    }
    
    func getIdBrand(index: Int) -> String{
        return arrayBrand[index].id
    }
}
