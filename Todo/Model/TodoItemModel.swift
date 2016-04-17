//
//  TodoItem.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import RealmSwift


class TodoItem: Object {
    dynamic var name = ""
    dynamic var done = ""
    dynamic var text = ""

    var todoList: TodoList {
        return linkingObjects(TodoList.self, forProperty: "items").first!
    }
}
