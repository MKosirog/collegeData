//
//  CollegeNSObject.swift
//  collegeData
//
//  Created by Mark C. Kosirog on 6/20/16.
//  Copyright © 2016 Mark C. Kosirog. All rights reserved.
//

import UIKit

//Created a custom class. CollegeNSObject inherits the 
//properties of NSOject
class CollegeNSObject: NSObject {
    // properties of this class
    var url = ""
    var name = ""
    var state = ""
    var population = 0
    var image = UIImage (named: "Default")
    
// conv init lets you quickly insert data all at once
    convenience init(url: String, name: String, state: String, population: Int, image: UIImage){
        self.init()
        self.url = url
        self.name = name
        self.state = state
        self.population = population
        self.image = image
    }
    
    // this initializes the alert with 3 text fields **** add 1 new property here URL
    convenience init(url: String, name: String, state: String) {
        self.init()
        self.url = url
        self.name = name
        self.state = state
    }
}


