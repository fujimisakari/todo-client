//
//  TodoListModel.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import SwiftyJSON
import RealmSwift


class TodoListModel: Object {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var desc = ""

    override static func primaryKey() -> String? {
      return "id"
    }

    class func createData(json: JSON) {
         let todoList = TodoListModel()
         todoList.id = json["id"].int!
         todoList.name = json["name"].string!
         todoList.desc = json["description"].string!

         let realm = try! Realm()
         try! realm.write {
             realm.add(todoList, update: true)
         }
    }

    func getItems() -> Results<TodoItemModel> {
        let items = try! Realm().objects(TodoItemModel).filter("todoListId = \(self.id)")
        return items
    }
}
