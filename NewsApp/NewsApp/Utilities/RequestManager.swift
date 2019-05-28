//
//  RequestManager.swift
//  NewsApp
//
//  Created by Apple on 16/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

final class RequestManager : NSObject {
    static let global = RequestManager()
    
    typealias RequestHandler = (_ jsonData : JSON? , _ error : String?) -> Void
    
    private var alamofireManager : Alamofire.SessionManager = Alamofire.SessionManager.default
    
    func jsonRequest (withUrl url : URL , method : HTTPMethod, urlParameters params : [String : Any]? = nil , headers : [String : String]? = nil , postData : [String : Any]? = nil, completion : @escaping RequestHandler) -> Request?
    {
        var urlString = url
        var requestParams : [String : Any]?
        
        switch method {
        case .get:
            requestParams = params
        case .post:
            requestParams = postData
        default:
            requestParams = params
        }
        
        let request = alamofireManager.request(urlString, method: method, parameters: requestParams, encoding: JSONEncoding.default, headers: headers)
        request.responseJSON { (responseData) in
            
            let result = responseData.result
            
            switch (result){
            case .success(let value):
                guard let jsonData : JSON = JSON(value) else {
                var errorMessage = "Error while calling services"
                    print(errorMessage)
                    completion( nil , errorMessage)
                    return
                }
                  completion(jsonData , nil)
                
            case .failure(let error):
                print(error)
                completion( nil , error.localizedDescription)
            }
        }
        
        if let innerRequest = request.request, let requestUrl = innerRequest.url {
            
            var requestLog = "\n\n API Hit:  \n\n \(requestUrl) \n\n Method: \(method.rawValue)\n\n"
            
            if let headers = headers, !headers.isEmpty {
                requestLog.append(" Headers: \n\n \(headers)\n\n")
            }
            print(requestLog)
        }
        
        return request
        
    }
    
    func  jsonGetRequest(withUrl url : URL , method : HTTPMethod, urlParameters params : [String : Any]? = nil , headers : [String : String]? = nil , completion : @escaping RequestHandler) -> Request?{
        
        return jsonRequest(withUrl : url, method: .get, urlParameters: params, headers: headers, postData: nil, completion: completion)
    }
    
}
