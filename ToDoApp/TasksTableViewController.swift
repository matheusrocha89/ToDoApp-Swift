//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Matheus on 15/09/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//

import UIKit
import CoreData
import ChameleonFramework

class TasksTableViewController: UITableViewController {
  
  private let tableCellIdentifier = "TaskCell"
  var tasks = [Tasks]()
  private let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  private let saveContext = (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext
  private let editTaskSegue = "editTask"
  private let addTaskSegue = "addTask"
  private let showDetailsTaskSegue = "showDetailsTask"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.tableView.allowsMultipleSelectionDuringEditing = false;
    
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
    if let ctrl = segue.sourceViewController as? AddTaskViewController {
      if ctrl.task != nil {
        self.tasks.append(ctrl.task)
        self.tableView.reloadData()
      }
    } else if let ctrl = segue.sourceViewController as? EditTaskViewController {
      if ctrl.taskToEdit != nil {
        let selectedIndexPath = self.tableView.indexPathForSelectedRow!
        self.tasks[selectedIndexPath.row] = ctrl.taskToEdit!
        self.tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
      }
    }
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier(tableCellIdentifier, forIndexPath: indexPath)
    cell.textLabel!.text = self.tasks[indexPath.row].title
    cell.detailTextLabel!.text = self.tasks[indexPath.row].comment
    cell.accessoryType = .DisclosureIndicator
    
    if (self.tasks[indexPath.row].completed != 0) {
      cell.textLabel!.textColor = UIColor.flatGrayColor()
      cell.detailTextLabel!.textColor = UIColor.flatGrayColor()
    } else {
      cell.textLabel!.textColor = UIColor.blackColor()
      cell.detailTextLabel!.textColor = UIColor.blackColor()
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
  
  /*
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
  }
  */


  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
  }
  
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      let taskToDelete = self.tasks[indexPath.row]
      // Delete from Core Data
      self.managedObjectContext.deleteObject(taskToDelete)
      self.saveContext()
      
      self.tasks.removeAtIndex(indexPath.row)
      tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
  }
  
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
  
  private func prepareForSegueAddTask() {
    
  }
  
  private func prepareForSegueShowDetailsTask(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let viewCtrl = segue.destinationViewController as! ShowDetailsViewController
    let cell = sender as! UITableViewCell
    
    viewCtrl.selectedTask = self.tasks[self.tableView.indexPathForCell(cell)!.row]
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    // TODO - Replace if for switch
    if segue.identifier == self.addTaskSegue {
      self.prepareForSegueAddTask()
    } else if segue.identifier == self.showDetailsTaskSegue {
      self.prepareForSegueShowDetailsTask(segue, sender:sender)
    }
  }
}
