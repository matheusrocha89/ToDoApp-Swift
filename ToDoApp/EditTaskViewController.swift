//
//  EditTaskViewController.swift
//  ToDoApp
//
//  Created by Matheus on 05/10/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//

import UIKit

class EditTaskViewController: UIViewController {
  
  @IBOutlet weak var taskTitle: UITextField!
  @IBOutlet weak var taskComment: UITextView!
  @IBOutlet weak var taskCompleted: UISwitch!
  var taskToEdit:Tasks?
  private let saveContext = (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext

  override func viewDidLoad() {
    super.viewDidLoad()
    self.taskComment.layer.borderColor = UIColor.lightGrayColor().CGColor
    
    if self.taskToEdit != nil {
      self.loadTaskToView()
    }

    // Do any additional setup after loading the view.
  }
  
  private func loadTaskToView() {
    self.taskTitle.text = self.taskToEdit!.title
    self.taskComment.text = self.taskToEdit!.comment
    self.taskCompleted.on = self.taskToEdit!.completed!.boolValue
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func editTask() {
    self.taskToEdit!.title = self.taskTitle.text
    self.taskToEdit!.comment = self.taskComment.text
    self.taskToEdit!.completed = self.taskCompleted.on
    self.saveContext()
  }

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    if !self.taskTitle.text!.isEmpty && self.taskToEdit != nil {
      self.editTask()
    }
  }

}
