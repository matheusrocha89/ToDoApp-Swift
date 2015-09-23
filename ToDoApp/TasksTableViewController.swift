//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Matheus on 15/09/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//

import UIKit
import CoreData

class TasksTableViewController: UITableViewController {
  
  let tableCellIdentifier = "TaskCell"
  var tasks = [Tasks]()
  let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  let saveContext = (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return tasks.count
  }
  
  @IBAction func unwindToList(segue: UIStoryboardSegue) {
    let ctrl:AddTaskViewController = segue.sourceViewController as! AddTaskViewController
    if (ctrl.task != nil) {
      self.tasks.append(ctrl.task)
      self.tableView.reloadData()
    }
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(tableCellIdentifier, forIndexPath: indexPath)
    cell.textLabel!.text = self.tasks[indexPath.row].title
    
    if (self.tasks[indexPath.row].completed != 0) {
      cell.accessoryType = UITableViewCellAccessoryType.Checkmark
    } else {
      cell.accessoryType = UITableViewCellAccessoryType.None
    }
    
    return cell
  }
  
  override func viewWillAppear(animated: Bool) {
    let fetchRequest = NSFetchRequest(entityName: "Tasks")
    do {
      let tasksRequested = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Tasks]
      if tasksRequested != nil {
        self.tasks = tasksRequested!
      }
      
    } catch let fetchError {
      NSLog("Unresolved error \(fetchError)")
    }
  }
  }
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
