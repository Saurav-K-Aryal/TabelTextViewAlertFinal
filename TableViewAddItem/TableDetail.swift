//
//  TableDetail.swift
//  TableViewAddItem
//
//  Created by Saurav Aryal on 3/6/16.
//  Copyright © 2016 Saurav Aryal. All rights reserved.
//

import UIKit



class TableDetail: UIViewController, UITextFieldDelegate{
    var text_data: String?
    var index: Int?
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var Label: UIButton!
    @IBOutlet weak var EmailValue: UILabel!
    
    override func viewDidLoad() {
        myTextField.becomeFirstResponder()
        myTextField.delegate = self
        myTextField.text = self.text_data
        
    }
    
    
    override func viewWillDisappear(animated: Bool) {

        if var edit = text_data{
            items[index!] = Objects(text: myTextField.text!)
        }
        else{
            if let addNext = myTextField.text{
                    items.append(Objects(text: myTextField.text!))
            }
        }
        
        
        func textFieldDidBeginEditing(textField: UITextField!) {
        }
        
        func textFieldShouldEndEditing(textField: UITextField!) -> Bool {
            return false
        }
        
        func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate
            myTextField.resignFirstResponder()
            return true
        }
        
    }
    
    
    @IBAction func DoneAction(sender: AnyObject) {
        myTextField.resignFirstResponder()
    }
   

   

    @IBAction func MapAction(sender: AnyObject) {
        let alertController = UIAlertController(title: "Button Alert Title", message: "ALERT MESSAGE!", preferredStyle: .Alert)
        
        alertController.addTextFieldWithConfigurationHandler(
            {
                (textField: UITextField!) in
                textField.placeholder = "Enter email address"
        })
        
        let OkButton = UIAlertAction(title: "Ok", style: .Default) {  (action) in
            if let textFields = alertController.textFields{
                let textFieldArray = textFields as [UITextField]
                let emailaddress = textFieldArray[0].text
                self.EmailValue.text = emailaddress
                print(emailaddress)
            }
        }
        alertController.addAction(OkButton)
        let CancelButton = UIAlertAction(title: "Cancel", style: .Default){(action) in
            print(action)
        }
        alertController.addAction(CancelButton)
        self.presentViewController(alertController, animated: true, completion: nil)
    }

}