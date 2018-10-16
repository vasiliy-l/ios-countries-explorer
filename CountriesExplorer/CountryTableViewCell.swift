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

class CountryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var flagWebView: WKWebView!
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
            if let urlString = item.flagUrl, let url = URL(string: urlString) {
                Alamofire.request(url).responseData { responseData in
                    if let imageData = responseData.data {
                        self.flagWebView.load(imageData, mimeType: "image/svg+xml", characterEncodingName: "UTF-8", baseURL: url)
                    }
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
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        if let url = URL(string: "about:blank") {
            flagWebView.load(URLRequest(url: url))
        }
    }
    
}
