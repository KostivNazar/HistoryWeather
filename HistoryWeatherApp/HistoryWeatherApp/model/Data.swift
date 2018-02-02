
////
////  MoreTableViewController.swift
////  WeatherApp
////
////  Created by Mac on 29.01.18.
////  Copyright © 2018 Mac. All rights reserved.
//
import UIKit

class Data {
     var year: String?
     var month: String?
     var tMax: String?
     var tMin: String?
     var airFrostDays: String?
     var rainfall: String?
     var sunshine: String?
     var other: String?
   
    
    init() {
    }
    
    init(dataArray: [String]) {
        self.year = dataArray.indices.contains(0) ? dataArray[0] : ""
        self.month = dataArray.indices.contains(1) ? dataArray[1] : ""
        self.tMax = dataArray.indices.contains(2) ? dataArray[2] : ""
        self.tMin = dataArray.indices.contains(3) ? dataArray[3] : ""
        self.airFrostDays = dataArray.indices.contains(4) ? dataArray[4] : ""
        self.rainfall = dataArray.indices.contains(5) ? dataArray[5] : ""
        self.sunshine = dataArray.indices.contains(6) ? dataArray[6] : ""
        self.other = dataArray.indices.contains(7) ? dataArray[6] : ""
    }
}
