//
//  StocksViewController.swift
//  stock
//
//  Created by Rafał Kampa on 04.05.2017.
//  Copyright © 2017 Rafał Kampa. All rights reserved.
//

import UIKit

class StocksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewModel = StocksViewModel()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib.init(nibName: "StocksTableViewCell", bundle: nil), forCellReuseIdentifier: "StocksTableViewCell")
        
        let timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(self.loadData), userInfo: nil, repeats: true);
        timer.fire()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadData() {
        self.viewModel.getStocks { (success) -> (Void) in
            self.tableView.reloadData()
        }
    }
    
    //MARK: TableViewDelegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StocksTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "StocksTableViewCell", for: indexPath) as! StocksTableViewCell
        
        cell.customizeWithStock(stock: self.viewModel.dataArray[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
