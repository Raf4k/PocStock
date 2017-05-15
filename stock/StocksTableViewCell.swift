//
//  StocksTableViewCell.swift
//  stock
//
//  Created by Rafał Kampa on 04.05.2017.
//  Copyright © 2017 Rafał Kampa. All rights reserved.
//

import UIKit

class StocksTableViewCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelValue: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func customizeWithStock(stock: Stocks) {
        self.labelName.text = stock.name
        self.labelValue.text = stock.value
        self.labelTime.text = stock.time
        if stock.wasChanges == true {
            self.backgroundColor = UIColor.red
        }else {
            self.backgroundColor = UIColor.clear
        }
    }
    
}
