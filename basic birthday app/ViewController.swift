//
//  ViewController.swift
//  basic birthday app
//
//  Created by abdullah's Monterey on 11.04.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var birthShowText: UILabel!
    @IBOutlet weak var nameShowText: UILabel!
    @IBOutlet weak var nameTextLabel: UITextField!
    @IBOutlet weak var birthTextLabel: UITextField!
    let dateformatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let storedName = UserDefaults.standard.object(forKey: "Name")
        let storedDate = UserDefaults.standard.object(forKey: "Date")
        
        //casting
        if let newName = storedName as? String{
            nameShowText.text = newName
        }
        if let newBirthday = storedDate as? String{
           birthShowText.text = "Birthday: \(newBirthday)"
        }
        
    }

    @IBAction func button(_ sender: Any) {
        
        nameShowText.text  = String("Name: \(nameTextLabel.text!)")
      
        //date info transformation to textlabel
       
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        birthShowText.text = "Birthday: \(dateformatter.string(from: date.date))"
       
        //save info to basic database
        UserDefaults.standard.set(dateformatter.string(from: date.date), forKey: "Date")
        UserDefaults.standard.set(nameShowText.text, forKey: "Name")
        
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        let storedName = UserDefaults.standard.object(forKey: "Name")
        let storedDate = UserDefaults.standard.object(forKey: "Date")
        if (storedName as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "Name")
            nameShowText.text = "Name:"
        }
        if (storedDate as? String) != nil{
            UserDefaults.standard.removeObject(forKey: "Date")
            birthShowText.text = "Birthday:"
        }
        
        
        
    }
    
}

