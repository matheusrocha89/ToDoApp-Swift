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

  override func viewDidLoad() {
    super.viewDidLoad()
    self.configTaskCommentBorder()

    // Do any additional setup after loading the view.
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
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
