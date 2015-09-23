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
  
  @IBOutlet weak var saveButton: UIBarButtonItem!
  @IBOutlet weak var taskTitle: UITextField!
  @IBOutlet weak var cancelButton: UIBarButtonItem!
  
  let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
  let saveContext = (UIApplication.sharedApplication().delegate as! AppDelegate).saveContext
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
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
