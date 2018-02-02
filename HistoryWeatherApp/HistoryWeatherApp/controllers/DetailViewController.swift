
////
////  MoreTableViewController.swift
////  WeatherApp
////
////  Created by Mac on 29.01.18.
////  Copyright © 2018 Mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak private var tableView: UITableView!
    
    // MARK: - Properties
    var dataLink = ""
    var mainTitle = ""
    fileprivate let cellId = "cellId"
    fileprivate var finalData: [Data] = []
    
    // MARK: - ViewController file cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = mainTitle
        
        loadDataFromInternet(path: dataLink)
        configureTableView()
    }
    
    // MARK: - Functions
    private func configureTableView() {
        tableView.dataSource = self
    }
    
    private func loadDataFromInternet(path: String) {
        guard let url: URL = URL(string: path) else { return }
        
        var dataString: String = ""
        
        do {
            dataString = try String(contentsOf: url)
        } catch let err {
            print(err)
        }
        
        makeArray(stringData: dataString)
    }
    
    private func makeArray(stringData: String) {
        // get only data from string
        let a = stringData.components(separatedBy: "hours")
        var b = a[1]
        
        // delete unwanted sigh and empty cell
        b = b.replacingOccurrences(of: "\r\n   ", with: "\n").trimmingCharacters(in: .whitespacesAndNewlines)
        
        // create lines of data
        let lines = b.components(separatedBy: "\n")
        
        for item in lines {
            
            var line = item
            let dataFromLine = line.changeSpaces(to: ":").components(separatedBy: ":")
            let data = Data(dataArray: dataFromLine)
            
            finalData.append(data)
        }
    }




    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellId) as? DataCell {
            cell.data = finalData[indexPath.row]
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

extension String {
    mutating func changeSpaces(to: String) -> String {
        
        self = self.trimmingCharacters(in: .whitespaces)
        self = self.replacingOccurrences(of: "          ", with: to)
        self = self.replacingOccurrences(of: "         ", with: to)
        self = self.replacingOccurrences(of: "        ", with: to)
        self = self.replacingOccurrences(of: "       ", with: to)
        self = self.replacingOccurrences(of: "      ", with: to)
        self = self.replacingOccurrences(of: "     ", with: to)
        self = self.replacingOccurrences(of: "    ", with: to)
        self = self.replacingOccurrences(of: "   ", with: to)
        self = self.replacingOccurrences(of: "  ", with: to)
        self = self.replacingOccurrences(of: " ", with: to)
        
        return self
    }
}
