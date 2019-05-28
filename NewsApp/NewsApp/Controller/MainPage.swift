//
//  ViewController.swift
//  NewsApp
//
//  Created by Apple on 06/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class MainPage: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sourceValues = [Source]()
    var arrResult = [JSON]()
    var cellIdentifier = "sourceCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.backBarButtonItem?.title = ""
        
        getAllSources { (success) in
            if success {
                if (self.sourceValues.count > 0 )
                {
                    self.tableView.reloadData()
                }
            }
        }
        
    }
    
}


extension MainPage : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sourceValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SourceCell else {
            return UITableViewCell()
        }
        
        let source = self.sourceValues[indexPath.row]
        cell.initData(source: source)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var selectedRow = indexPath.row
        let sourceName = sourceValues[selectedRow].id
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "headingSegue", sender: sourceName)
        
    }
    
    
}


extension MainPage {
    func getAllSources(completion : @escaping completionHandler)
    {
        
        let sourceUrl = BaseURL+"?apiKey="+API_KEY
      //  let params : [String: String] = ["apiKey" : API_KEY]
        
        _ = RequestManager.global.jsonGetRequest(withUrl: URL(string: sourceUrl)!, method: .get, completion: { (jsonData, error) in
            
            guard error == nil else {
                completion(false)
                return
            }
            
            let swiftJson = jsonData
            if let data = swiftJson!["sources"].array {
                self.arrResult = data
                print(self.arrResult)
                for arr in self.arrResult {
                    let source = Source(json: arr)
                    self.sourceValues.append(source)
                }
                completion(true)     }
        })
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TopHeadingVC {
            vc.sourceId = sender as! String
        }
    }
}

