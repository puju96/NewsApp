//
//  TopHeadingCell.swift
//  NewsApp
//
//  Created by Apple on 19/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit
import Foundation

class TopHeadingCell: UITableViewCell {

 
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var newDesc: UILabel!
    @IBOutlet weak var publishedDate: UILabel!
    @IBOutlet weak var newsUrl: UILabel!
    @IBOutlet weak var topHeading: UILabel!
    
   func  initData(headlines : Headlines)
   {
    let date = getDateString(dateString: headlines.publishedDate!)
    self.topHeading.text = headlines.title
    self.newsUrl.text = headlines.url
    self.publishedDate.text = date
    self.newDesc.text = headlines.description
    
 
 
    let imgUrl = URL(string: headlines.imageUrl!)
        if imgUrl != nil
    {
        let imgData = NSData(contentsOf: imgUrl!)
        if imgData != nil
        {
          self.newsImage.image = UIImage(data: imgData! as Data)
        }
        else {
            self.newsImage.image = UIImage(named: "news")
        }
    }
    
    }
    
    func getDateString(dateString : String) -> String {
 
        let date = dateString.prefix(10)
            let start = dateString.index(dateString.startIndex, offsetBy: 11)
        let end = dateString.index(dateString.endIndex, offsetBy: -1)
        let range = start..<end
        let timeSubstring = dateString[range]

    let fullDateString = String(date) + "," + String(timeSubstring)
        return fullDateString
    }
    
    
}
