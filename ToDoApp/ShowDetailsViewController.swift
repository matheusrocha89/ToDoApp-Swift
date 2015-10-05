//
//  ShowDetailsViewController.swift
//  ToDoApp
//
//  Created by Matheus on 05/10/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//

import UIKit
import ChameleonFramework

class ShowDetailsViewController: UIViewController {

  @IBOutlet weak var taskCompleted: UISwitch!
  @IBOutlet weak var taskComment: UITextView!
  @IBOutlet weak var taskTitle: UILabel!
  var selectedTask:Tasks?
  private let editTaskSegue = "editTask"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.configTaskCommentBorder()
    
    if  self.selectedTask != nil {
      self.loadTaskToView()
    }
    // Do any additional setup after loading the view.
  }
  
  private func loadTaskToView() {
    self.taskTitle.text = self.selectedTask!.title
    self.taskComment.text = self.selectedTask!.comment
    self.taskCompleted.on = self.selectedTask!.completed!.boolValue
  }
  
  private func configTaskCommentBorder() {
    self.taskComment.layer.borderColor = UIColor.lightGrayColor().CGColor
    self.taskComment.layer.borderWidth = 0.4
    self.taskComment.layer.cornerRadius = 8.0
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  private func prepareForSegueEditTask(segue: UIStoryboardSegue) {
    let editViewCtrl = segue.destinationViewController as! EditTaskViewController
    editViewCtrl.taskToEdit = self.selectedTask!
  }

  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    
    if segue.identifier == self.editTaskSegue {
      self.prepareForSegueEditTask(segue)
    }
  }

}
