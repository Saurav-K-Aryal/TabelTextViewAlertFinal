//
//  ViewController.swift
//  TableViewAddItem
//
//  Created by Saurav Aryal on 3/6/16.
//  Copyright © 2016 Saurav Aryal. All rights reserved.
//

import UIKit

class Objects: NSObject{
    
    var text:String;
    
    init(text: String) {
        self.text = text;
        super.init();
    }
}

var items = [Objects]()


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet weak var Edit: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myTableView.delegate = self
        myTableView.dataSource = self
        self.myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        let row = indexPath.row
        
        cell.textLabel?.text = items[row].text
        return cell
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        if (self.myTableView.editing) {
            return UITableViewCellEditingStyle.Delete
        }
        return UITableViewCellEditingStyle.None
    }
    
    
    
    @IBAction func editAction(sender: AnyObject) {
        if (self.myTableView.editing) {
            Edit.title = "Edit"
            self.myTableView.setEditing(false, animated: true)
        } else {
            Edit.title = "Done"
            self.myTableView.setEditing(true, animated: true)
        }
    }
   
    
    override func viewWillAppear(animated: Bool) {
        myTableView.reloadData()
    }


    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("seguePlease", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "seguePlease", let destination = segue.destinationViewController as? TableDetail {
            if let indexPath = self.myTableView.indexPathForSelectedRow{
                let text_data = items[indexPath.row].text
                destination.text_data = text_data
                destination.index = indexPath.row
            }
            
        }
    }


}

