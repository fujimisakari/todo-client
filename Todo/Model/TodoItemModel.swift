//
//  TodoItemModel.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import SwiftyJSON


class TodoItemModel: Object, Mappable {
    dynamic var id = 0
    dynamic var text = ""
    dynamic var done = false
    dynamic var todoListId = 0

    required convenience init?(_ map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id          <- map["id"]
        text        <- map["text"]
        done        <- map["done"]
        todoListId  <- map["todo_list_id"]
    }

    override static func primaryKey() -> String? {
        return "id"
    }

    var todoList: TodoListModel {
        return linkingObjects(TodoListModel.self, forProperty: "items").first!
    }

    override static func indexedProperties() -> [String] {
        return ["todoListId"]
    }

    class func createData(jsonDict: Dictionary<String, AnyObject>) {
         guard let todoItem = Mapper<TodoItemModel>().map(jsonDict) else {
             return
         }

         do {
             let realm = try Realm()
             try realm.write {
                 realm.add(todoItem, update: true)
             }
         } catch {}
    }
}
