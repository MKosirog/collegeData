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
        var college : [CollegeNSObject] = []
    
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
        {
            let dvc = segue.destinationViewController as! DetailViewController
            let index = tableView.indexPathForSelectedRow?.row
            dvc.college = college[index!]
        }
        override func viewWillAppear(animated: Bool)
        {
            super.viewWillAppear(animated)
            tableView.reloadData()
        }
    
    
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
                self.college.append(CollegeNSObject( name: collegeTextField.text!))
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
        else
        {
            tableView.editing = false
            sender.tag = 0
        }
    }
    
        @IBOutlet weak var tableView: UITableView!
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
            editButton.tag = 0
            college.append(CollegeNSObject(name: "North Park University", state: "IL", population: 1400, image: UIImage(named: "NP")!))
            college.append(CollegeNSObject(name: "University of Illinois", state: "IL", population: 32400, image: UIImage(named: "UIL")!))
            college.append(CollegeNSObject(name: "Illinois State University", state: "IL", population: 26400, image: UIImage(named: "ISU")!))
            college.append(CollegeNSObject(name: "Illinois Weslyan University", state: "IL", population: 3400, image: UIImage(named: "IWU")!))
        }

        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
        }

        func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
        {
            return college.count
        }
    
        func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
        {
            let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
            cell.textLabel?.text = college[indexPath.row].name
            return cell
        }
        func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
        {
            if editingStyle == .Delete
                {
                    college.removeAtIndex(indexPath.row)
                    tableView.reloadData()
                }
        }
        func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
        {
            return true
        }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let colleges = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(colleges, atIndex: destinationIndexPath.row)
    }
}

