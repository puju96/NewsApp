//
//  NewsSourceManager.swift
//  NewsApp
//
//  Created by Apple on 16/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import SwiftyJSON

class NewsManager {
    typealias jsonObjectData = (_ success: Bool, _ jsonObject: JsonInitializable?) -> Void
    static let global = NewsManager()
    
    let requestManager = RequestManager()
    
   
    
}
