
////
////  MoreTableViewController.swift
////  WeatherApp
////
////  Created by Mac on 29.01.18.
////  Copyright © 2018 Mac. All rights reserved.
//
//

import UIKit
import SafariServices
class MoreTableViewController: UITableViewController {
    
    var sectionTitle = "Info"
    var sectionContent = ["Instrumentation", "Location", "Meanings"]
    var links = ["https://en.wikipedia.org/wiki/Meteorological_instrumentation", "https://www.metoffice.gov.uk/public/weather/climate-historic/#?tab=climateHistoric", "https://en.wikipedia.org/wiki/Weather_station"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sectionContent.count
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitle
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = sectionContent[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let url = URL(string: links[indexPath.row]) {
            let safariView = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            present(safariView, animated: true, completion: nil)
        }
        
    }
    
    
    
}


