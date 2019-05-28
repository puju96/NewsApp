//
//  ApiManager.swift
//  NewsApp
//
//  Created by Apple on 07/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import SwiftyJSON
import Alamofire

//ztypealias ServiceResponse = (JSON , Error!) -> Void

//class ApiManager : NSObject {
//    static let sharedInstance = ApiManager()
//    var Sources = [Source]()
//    var arrResult = [[String: AnyObject]]()
//
//    func getAllSources(completion : @escaping completionHandler)
//        {
//            Alamofire.request(SourceURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
//
//                if (response.result.value != nil)
//                {
//
//                    let swiftJson = JSON(response.result.value!)
//                    if let data = swiftJson["sources"].arrayObject {
//                        self.arrResult = data as! [[String : AnyObject]]
//                    }
//
//                    if (self.arrResult.count > 0)
//                    {
//
//                    }
//
//                }
//
//            }
//        }
//
//}
