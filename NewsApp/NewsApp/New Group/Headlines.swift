//
//  Headlines.swift
//  NewsApp
//
//  Created by Apple on 19/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Headlines {
    var author : String?
       var title : String?
       var description : String?
       var url : String?
       var imageUrl : String?
       var publishedDate : String?
       var content : String?
    
    init(json: JSON) {
        
        author = json["author"].stringValue
        title = json["title"].stringValue
        description = json["description"].stringValue
        url = json["url"].stringValue
        imageUrl = json["urlToImage"].stringValue
        publishedDate = json["publishedAt"].stringValue
        content = json["content"].stringValue
    }
}

