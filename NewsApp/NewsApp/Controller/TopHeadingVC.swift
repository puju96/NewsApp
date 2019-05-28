//
//  TopHeadingVC.swift
//  NewsApp
//
//  Created by Apple on 19/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import SwiftyJSON
class TopHeadingVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var sourceId : String!
    var arrResult = [JSON]()
    var articleArray = [Headlines]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        navigationItem.backBarButtonItem?.title = ""
        
        getHeadingsForSelectedItem(sourceId: sourceId) { (success) in
            if success
            {
                if (self.articleArray.count > 0)
                {
                    self.tableView.reloadData()
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = sourceId

        
    }
    

   
}

extension TopHeadingVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articleArray.count)
        return articleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "headingCell", for: indexPath) as? TopHeadingCell
            else {  return UITableViewCell() }
                
        let headlines = articleArray[indexPath.row]
        cell.initData(headlines: headlines)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var selectedRow = indexPath.row
        let urlString = articleArray[selectedRow].url
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "detailSegue", sender: urlString)
    }
    
    
}


extension TopHeadingVC {
    
    func   getHeadingsForSelectedItem( sourceId : String , completion : @escaping completionHandler)
    {
        let TopHeadingURL = HeadingBaseUrl+sourceId+"&apiKey="+API_KEY
        _ = RequestManager.global.jsonGetRequest(withUrl: URL(string: TopHeadingURL)!, method: .get, completion: { (jsonData, error) in
            
            guard error == nil else {
                print("Error occured while fetching data")
                completion(false)
                return
            }
            
            let swiftJson = jsonData
            if let data = swiftJson!["articles"].array {
                self.arrResult = data
                for arr in self.arrResult {
                    let headlines = Headlines(json: arr)
                    self.articleArray.append(headlines)
                }
                completion(true)
            }
        })
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DetailViewController {
            vc.urlString = sender as! String
        }
    }
    
}

extension TopHeadingVC : UIWebViewDelegate {
    
}
