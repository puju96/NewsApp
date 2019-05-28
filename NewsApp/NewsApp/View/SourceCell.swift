//
//  SourceCell.swift
//  NewsApp
//
//  Created by Apple on 06/05/19.
//  Copyright © 2019 Apple. All rights reserved.
//

import UIKit

class SourceCell: UITableViewCell {

    @IBOutlet weak var sourceDiscription: UILabel!
   
    @IBOutlet weak var sourceTitle: UILabel!
 
   func  initData( source : Source)
    {
    self.sourceTitle.text = source.name
    self.sourceDiscription.text = source.discription
    }

}
