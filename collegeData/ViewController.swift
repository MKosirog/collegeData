//
//  ViewController.swift
//  collegeData
//
//  Created by Mark C. Kosirog on 6/20/16.
//  Copyright © 2016 Mark C. Kosirog. All rights reserved.
//

//UIKit is a framework that has built in stuff

import UIKit


// for tableview to work must insert DataSource and delegate protocols
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    //array of college objects. [] are used to tell array which is empty
    var college : [CollegeNSObject] = []
   
    // allows you to go from one VC to the next this lets you pass data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        // variable show which VC you are moving to
        let dvc = segue.destinationViewController as! DetailViewController
        // references the row that you click on in the table
        let index = tableView.indexPathForSelectedRow?.row
        //tells you which row you tapped on (its index) and pass it to dvc.college
        //index is the ball college is the quaterback and dvc.college is the receiver
        dvc.college = college[index!]
   //Stretch #1
        dvc.title = college[index!].name
        
    }
        //this allows you to reload the screen whenn you add to the table
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    //when tapped adds Name of college which is a different button UIBarButton
    
    @IBAction func onTappedPlusButton(sender: UIBarButtonItem)
    {
        //sets the alert controller title, creates an instance of alertcontroller
        let alert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        //added URL
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add URL Here"}
        //added college text field
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Add College Here"}
            //added state text field
        alert.addTextFieldWithConfigurationHandler { (textField) -> Void in
                textField.placeholder = "Add State Here"
        }
        //dismisses the alert
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        //lets you add the cancel action insert
        
        alert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default){ (action) -> Void in
            let collegeUrlTextField = alert.textFields! [0] as UITextField
            let collegeTextField = alert.textFields![1] as UITextField
            let collegeStateField = alert.textFields! [2] as UITextField
            //add in
            self.college.append(CollegeNSObject(url: collegeUrlTextField.text!, name: collegeTextField.text!, state: collegeStateField.text!))
                
                //url: collegeUrlTextField, name: collegeTextField, state: collegeStateField))
            
            self.tableView.reloadData()
        }
        // adds the action we described to the alert view
        alert.addAction(addAction)
        //this makes the alert show up
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    //allows you to edit tableView
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
        
        //appends to the array *** will need to add URL
        college.append(CollegeNSObject(url: "http://www.northpark.edu/",name: "North Park University", state: "IL", population: 1400, image: UIImage(named: "NP")!))
        college.append(CollegeNSObject(url: "http://illinois.edu/",name: "University of Illinois", state: "IL", population: 32400, image: UIImage(named: "UIL")!))
        college.append(CollegeNSObject(url: "http://illinoisstate.edu/",name: "Illinois State University", state: "IL", population: 26400, image: UIImage(named: "ISU")!))
        college.append(CollegeNSObject(url: "https://www.iwu.edu/",name: "Illinois Weslyan University", state: "IL", population: 3400, image: UIImage(named: "IWU")!))
    }
    
    
    // ** required Func  allows you to say how many rows the table view will haveMaking it "count" allows you to add and not be constrained by a number
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    //** required Func  Call in prototype cell to fill in the cells of the table
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        cell.textLabel?.text = college[indexPath.row].name
        //added detail in bottom left of cell
        cell.detailTextLabel?.text = college[indexPath.row].state
        return cell
    }
    
    //not a required func.  gives you ability to edit/delete in the table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            // deletes item from array
            college.removeAtIndex(indexPath.row)
            tableView.reloadData()
        }
    }
   // allows you to move the rows around
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    //changes the order of the array
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let colleges = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(colleges, atIndex: destinationIndexPath.row)
    }
}


