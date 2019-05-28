//
//  Source.swift
//  NewsApp
//
//  Created by Apple on 06/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON


struct Source {
    var id : String?
    var name : String?
    var discription : String?
    var url : String?
    var category : String?
    var language : String?
    var country : String?
    

     init(json :JSON)
    {
        id = json["id"].stringValue
        name = json["name"].stringValue
        discription = json["description"].stringValue
        url = json["url"].stringValue
        category = json["category"].stringValue
        language = json["language"].stringValue
        country = json["country"].stringValue

    }
}
