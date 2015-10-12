//
//  ToDoViewController.swift
//  To-Do List
//
//  Created by Nag Alluri on 10/9/15.
//  Copyright © 2015 Nag Alluri. All rights reserved.
//

import UIKit



class ToDoViewController: UITableViewController {
    
    var ToDoItems: [ToDoItem] = []
    
    func loadInitialData() {
        ToDoItems = [
            ToDoItem(itemName: "Go to the dentist"),
            ToDoItem(itemName: "Fetch groceries"),
            ToDoItem(itemName: "Sleep")
        ]
    }
    
    @IBAction func unwindAndAddToList(segue: UIStoryboardSegue) {
        let source = segue.sourceViewController as! AddToDoViewController
        let todoItem:ToDoItem = source.todoItem
        
        if todoItem.itemName != "" {
            self.ToDoItems.append(todoItem)
            self.tableView.reloadData()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tempCell = tableView.dequeueReusableCellWithIdentifier("SampleCell") as UITableViewCell!
        let ToDoItem = ToDoItems[indexPath.row]
        
        // Downcast from UILabel? to UILabel
        let cell = tempCell.textLabel as UILabel!
        cell.text = ToDoItem.itemName

        if (ToDoItem.completed) {
            tempCell.accessoryType = UITableViewCellAccessoryType.Checkmark;
        } else {
            tempCell.accessoryType = UITableViewCellAccessoryType.None;
        }
        
        return tempCell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ToDoItems.count
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        let tappedItem = ToDoItems[indexPath.row] as ToDoItem
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: (NSIndexPath!)) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            ToDoItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}
