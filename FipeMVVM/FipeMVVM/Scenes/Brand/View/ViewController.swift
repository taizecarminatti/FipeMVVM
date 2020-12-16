//
//  ViewController.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 11/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableViewBrand: UITableView!
    
    var viewModel = BrandViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBrand.delegate = self
        tableViewBrand.dataSource = self
        
        viewModel.getBrand { sucess in
            if sucess{
                self.tableViewBrand.reloadData()
            }
        }
    }
}


extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenCarModel = UIStoryboard(name: "Model", bundle: nil).instantiateInitialViewController() as? ModelViewController{
            
            screenCarModel.idBrand = viewModel.getIdBrand(index: indexPath.row)
            navigationController?.pushViewController(screenCarModel, animated: true)
        }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(viewModel.arrayBrand.count)
        return viewModel.getArrayBrand().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.getNameBrand(index: indexPath.row)
        
        return cell
    }
}
