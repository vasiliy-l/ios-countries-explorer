//
//  CountryTableViewCell.swift
//  CountriesExplorer
//
//  Created by  William on 10/14/18.
//  Copyright © 2018 Vasiliy Lada. All rights reserved.
//

import UIKit
import Alamofire
import WebKit
import SVGKit

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var capital: UILabel!
    @IBOutlet weak var currencies: UILabel!
    
    var item: Country? {
        didSet {
            guard let item = item else {
                return
            }
            
            countryName.text = item.name
            capital.text = item.capital
            currencies.text = item.currencies?.joined(separator: ",")
            
            DispatchQueue.main.async {
                guard let svgUrl = item.flagUrl else {
                    return
                }
                self.flagImage.contentMode = .scaleAspectFit
                self.flagImage.backgroundColor = nil
                if let url = URL(string: svgUrl) {
                    self.flagImage.image = SVGKImage(contentsOf: url)?.uiImage
                }
            }
        }
    }
    
    static var nib:UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
    
    static var identifier: String {
        return String(describing: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.accessoryType = .disclosureIndicator
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        countryName.text = ""
        capital.text = ""
        currencies.text = ""
        flagImage.contentMode = .center
        flagImage.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)
        flagImage.image = UIImage(named: "flag")
    }
    
}
