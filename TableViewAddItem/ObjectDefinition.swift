//
//  ObjectDefinition.swift
//  TableViewAddItem
//
//  Created by Saurav Aryal on 3/8/16.
//  Copyright © 2016 Roshan Thapaliya. All rights reserved.
//

import UIKit

class Objects: NSObject{
    
    var text:String;
    
    init(text: String) {
        self.text = text;
        super.init();
    }
}