//
//  YearModelViewController.swift
//  FipeMVVM
//
//  Created by Taize Carminatti on 7/12/20.
//

import UIKit

class YearModelViewController: UIViewController {

    @IBOutlet var tableViewYearModel: UITableView!

    var viewModel = YearModelViewModel()
    var idBrand: String?
    var idModel: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewYearModel.delegate = self
        tableViewYearModel.dataSource = self
        
        viewModel.idModel = idModel
        viewModel.idBrand = idBrand
        
        
        viewModel.getYearModel { sucess in
            self.tableViewYearModel.reloadData()
        }
    }

}


extension YearModelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let screenCarDetail = UIStoryboard(name: "CarDetail", bundle: nil).instantiateInitialViewController() as? CarDetailViewController{
            screenCarDetail.idModel = idModel
            screenCarDetail.idBrand = idBrand
            screenCarDetail.idCarYear = viewModel.getIdYear(index: indexPath.row)
            
            navigationController?.pushViewController(screenCarDetail, animated: true)
            
        }
    }
}

extension YearModelViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getArrayYearModel().count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text = viewModel.getYear(index: indexPath.row)
        
        return cell
    }
}
