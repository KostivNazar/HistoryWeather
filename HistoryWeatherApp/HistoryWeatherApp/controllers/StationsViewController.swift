
////
////  MoreTableViewController.swift
////  WeatherApp
////
////  Created by Mac on 29.01.18.
////  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class StationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak private var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    private let linkToData = "https://data.gov.uk/dataset/historic-monthly-meteorological-station-data/datapackage.json"
    fileprivate var dataLink = String()
    fileprivate var dataTitle = String()
    fileprivate let cellId = "cellId"
    
    fileprivate var mainData: [String: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        downloadJson(link: linkToData) {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    
    private func downloadJson(link: String, completed: @escaping () -> ()) {
        let myUrl = URL(string: link)
        
        let task = URLSession.shared.dataTask(with: myUrl!) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                
                let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: AnyObject]
                
                if let resources = json["resources"] as? [[String: AnyObject]] {
                    
                    for resource in resources {
                        if resource["format"] as? String == "TXT" {
                            if let description = resource["description"] as? String, let url = resource["url"] as? String {
                                let cityCheck = description.components(separatedBy: "station ")
                                let city = cityCheck[1]
                                
                                self.mainData[city] = url
                            }
                        }
                    }
                }
                
                
            } catch let error {
                print(error)
            }
            
            completed()
        }
        
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showDetail" else { return }
        
        if let destinationVC = segue.destination as? DetailViewController {
            destinationVC.dataLink = dataLink
            destinationVC.mainTitle = dataTitle
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
        
        cell?.textLabel?.text = Array(mainData.keys).sorted(by: <)[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        
        guard let key = cell?.textLabel?.text, let path = mainData[key] else { return }
        
        dataTitle = key
        dataLink = path
        
        performSegue(withIdentifier: "showDetail", sender: self)
    }
    


}
