
////
////  MoreTableViewController.swift
////  WeatherApp
////
////  Created by Mac on 29.01.18.
////  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {
    
    @IBOutlet weak var year: UILabel!
    @IBOutlet weak var month: UILabel!
    @IBOutlet weak var tMin: UILabel!
    @IBOutlet weak var tMax: UILabel!
    @IBOutlet weak var airFrostDays: UILabel!
    @IBOutlet weak var rainFall: UILabel!
    @IBOutlet weak var sunshine: UILabel!
    @IBOutlet weak var other: UILabel!
    
    var data: Data? {
        didSet {
            guard let data = data else { return }
            
            year.text = data.year
            month.text = data.month
            tMin.text = data.tMin
            tMax.text = data.tMax
            airFrostDays.text = data.airFrostDays
            rainFall.text = data.rainfall
            sunshine.text = data.sunshine
            other.text = data.other
        }
    }
    
    
}
