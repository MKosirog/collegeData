//
//  ViewController.swift
//  collegeData
//
//  Created by Mark C. Kosirog on 6/20/16.
//  Copyright © 2016 Mark C. Kosirog. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
    {

        @IBOutlet weak var tableView: UITableView!
    
        var colleges = ["North Park", "Illinois State", "Illinois", "Illinois Weslyan"]
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }

        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return colleges.count
        }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
            cell.textLabel?.text = colleges[indexPath.row]
            return cell
        }
    

    }

