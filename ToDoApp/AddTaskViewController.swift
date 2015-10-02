//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Matheus on 15/09/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {
  var task:Tasks!
  
  @IBOutlet weak var taskCompleted: UISwitch!
  @IBOutlet weak var taskComment: UITextView!
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var taskTitle: UITextField!
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  var selectedTask:Tasks?
  
  let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  let saveContext = (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext
  
  private func configTaskCommentBorder() {
    self.taskComment.layer.borderColor = UIColor.lightGrayColor().CGColor
    self.taskComment.layer.borderWidth = 0.4
    self.taskComment.layer.cornerRadius = 8.0
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configTaskCommentBorder()
    if self.selectedTask != nil {
      self.taskTitle.text = self.selectedTask!.title
      self.taskComment.text = self.selectedTask!.comment
      self.taskCompleted.on = self.selectedTask!.completed!.boolValue
    }
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func saveTask() -> Tasks {
    let task = NSEntityDescription.insertNewObjectForEntityForName("Tasks", inManagedObjectContext: self.managedObjectContext) as! Tasks
    task.title = self.taskTitle.text
    task.comment = self.taskComment.text
    task.completed = self.taskCompleted.on
    self.saveContext()
    return task
  }
  
  func editTask() {
    self.selectedTask!.title = self.taskTitle.text
    self.selectedTask!.comment = self.taskComment.text
    self.selectedTask!.completed = self.taskCompleted.on
    self.saveContext()
  }
  
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if !(sender!.isEqual(self.saveButton)) { return }
    if !(self.taskTitle.text!.isEmpty) {
      if self.selectedTask == nil {
        self.task = self.saveTask()
      } else {
        self.editTask()
      }
    }
  }
}
