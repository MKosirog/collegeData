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
        @IBAction func onTappedPlusButton(sender: UIBarButtonItem)
        {
            let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)

            
            
            alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Add College Here"
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            alert.addAction(cancelAction)
            let addAction = UIAlertAction(title: "Add", style: .Default){ (action) -> Void in
            let collegeTextField = alert.textFields![0] as UITextField
            self.colleges.append(collegeTextField.text!)
            self.tableView.reloadData()
            }
            alert.addAction(addAction)
            self.presentViewController(alert, animated: true, completion: nil)
            
        }

        @IBOutlet weak var editButton: UIBarButtonItem!
    @IBAction func onTappedEditButton(sender: UIBarButtonItem) {
        if sender.tag == 0
        {
            tableView.editing = true
            sender.tag = 1
        }
        else {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
        @IBOutlet weak var tableView: UITableView!
    
        var colleges = ["North Park", "Illinois State", "Illinois", "Illinois Weslyan"]
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
            editButton.tag = 0
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
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
        {
            if editingStyle == .Delete
                {
                    colleges.removeAtIndex(indexPath.row)
                    tableView.reloadData()
                }
        }
        func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
        {
            return true
        }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
    }
    
}

