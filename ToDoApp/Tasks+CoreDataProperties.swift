//
//  Tasks+CoreDataProperties.swift
//  ToDoApp
//
//  Created by Matheus on 30/09/15.
//  Copyright © 2015 Matheus Cruz Rocha. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Tasks {

    @NSManaged var completed: NSNumber?
    @NSManaged var title: String?
    @NSManaged var comment: String?

}
