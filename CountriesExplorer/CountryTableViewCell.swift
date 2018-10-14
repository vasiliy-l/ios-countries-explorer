//
//  CountryTableViewCell.swift
//  CountriesExplorer
//
//  Created by  William on 10/14/18.
//  Copyright © 2018 Vasiliy Lada. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
    static let reuseIdentifier = "countryCell"

    @IBOutlet var countryName: UILabel!
    @IBOutlet var capital: UILabel!
    @IBOutlet var currencies: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
