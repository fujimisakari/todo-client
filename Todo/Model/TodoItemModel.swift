//
//  TodoItemModel.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift


class TodoItemModel: Object {
    dynamic var id = 0
    dynamic var text = ""
    dynamic var done = false
    dynamic var todoListId = 0

    override static func primaryKey() -> String? {
      return "id"
    }

    var todoList: TodoListModel {
        return linkingObjects(TodoListModel.self, forProperty: "items").first!
    }

    override static func indexedProperties() -> [String] {
      return ["todoListId"]
    }

    class func createData(json: JSON) {
         let todoItem = TodoItemModel()
         todoItem.id = json["id"].int!
         todoItem.text = json["text"].string!
         todoItem.done = json["done"].bool!
         todoItem.todoListId = json["todo_list_id"].int!

         let realm = try! Realm()
         try! realm.write {
             realm.add(todoItem, update: true)
         }
    }
}
