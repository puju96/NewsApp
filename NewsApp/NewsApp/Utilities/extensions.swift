//
//  extensions.swift
//  NewsApp
//
//  Created by Apple on 23/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import Foundation

extension DateFormatter {
    
    func FullDateString(dateString : String) -> String{
        
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyy-mm-dd hh:mm:ss"
        guard let date  = dateFormatter.date(from: dateString) else {
            print("Error while converting date into proper format")
            return ""
        }
        return dateFormatter.string(from: date)
        
    }
}
