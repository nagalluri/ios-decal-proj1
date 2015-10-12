//
//  ToDoItem.swift
//  To-Do List
//
//  Created by Nag Alluri on 10/12/15.
//  Copyright © 2015 Nag Alluri. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    let itemName: String
    var completed: Bool
    
    init(itemName: String, completed: Bool = false) {
        self.itemName = itemName
        self.completed = completed
    }

}
