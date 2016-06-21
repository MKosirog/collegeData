//
//  DetailViewController.swift
//  collegeData
//
//  Created by Mark C. Kosirog on 6/20/16.
//  Copyright © 2016 Mark C. Kosirog. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
// saves info put into text fields
    @IBAction func onTappedSavedButton(sender: UIButton) {
        college.url = URLTextField.text!
        college.name = collegeTextField.text!
        college.state = stateTextField.text!
        //because population is in INT you need to convert to string
        college.population = Int(populationTextField.text!)!
        
    }
    @IBOutlet weak var URLTextField: UITextField!
    @IBOutlet weak var populationTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!

    @IBOutlet weak var collegeTextField: UITextField!
    
    @IBOutlet weak var imageView: UIImageView!
    
    // receives info from prepare for segue
    var college : CollegeNSObject!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        URLTextField.text = college.url
        collegeTextField.text = college.name
        stateTextField.text = college.state
        populationTextField.text = String(college.population)
        imageView.image = college.image
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
