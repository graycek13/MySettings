//
//  ViewController.swift
//  MySettings
//
//  Created by user160057 on 10/28/19.
//  Copyright © 2019 user160057. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//Outlets
    @IBOutlet weak var txtFirstName: UITextField!
    
    @IBOutlet weak var txtLastName: UITextField!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtAddress: UITextField!
    
    @IBOutlet weak var txtFavColor: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Action
    @IBAction func btnSave(_ sender: UIButton) {
        
        let defaults: UserDefaults = UserDefaults.standard
        
        defaults.set (self.txtFirstName.text, forKey: "firstname")
        defaults.set (self.txtLastName.text, forKey: "lastname")
        defaults.set (self.txtEmail.text, forKey: "email")
        defaults.set (self.txtAddress.text, forKey: "address")
        defaults.set (self.txtFavColor.text, forKey: "favColor")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d, yyyy"
        
        let newDate = dateFormatter.string (from: datePicker.date)
        defaults.set(newDate, forKey: "bdate")
        print (datePicker.date.description)
        defaults.synchronize()
        clear()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let defaults: UserDefaults = UserDefaults.standard
        
        if defaults.string(forKey: "firstname") != nil{
            txtFirstName.text = defaults.string(forKey: "firstname")
        }
        
        if defaults.string(forKey: "lastname") != nil{
            txtLastName.text = defaults.string(forKey: "lastname")
        }
        
        if defaults.string(forKey: "email") != nil{
            txtEmail.text = defaults.string(forKey: "email")
        }
            
        if defaults.string(forKey: "address") != nil{
            txtAddress.text = defaults.string(forKey: "address")
        }
            
        if defaults.string(forKey: "bdate") != nil{
            let bdate = defaults.string(forKey: "bdate")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM d, yyyy"
            let date = dateFormatter.date(from: bdate!)
            datePicker.setDate(date!, animated: true)
        }
    }
            func clear()
        {
            txtEmail.resignFirstResponder()
            txtFirstName.resignFirstResponder()
            txtLastName.resignFirstResponder()
            txtAddress.resignFirstResponder()
            txtFavColor.resignFirstResponder()
        }
    }


