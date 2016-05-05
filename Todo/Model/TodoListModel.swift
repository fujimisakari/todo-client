//
//  TodoListModel.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift
import SwiftyJSON


class TodoListModel: Object, Mappable {
    dynamic var id = 0
    dynamic var name = ""
    dynamic var desc = ""

    required convenience init?(_ map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id    <- map["id"]
        name  <- map["name"]
        desc  <- map["desc"]
    }

    override static func primaryKey() -> String? {
      return "id"
    }

    class func createData(jsonDict: Dictionary<String, AnyObject>) {
         guard let todoList = Mapper<TodoListModel>().map(jsonDict) else {
             return
         }

         do {
             let realm = try Realm()
             try realm.write {
                 realm.add(todoList, update: true)
             }
         } catch {}
    }

    func getItems() -> Results<TodoItemModel> {
        let items = try! Realm().objects(TodoItemModel).filter("todoListId = \(self.id)")
        return items
    }
}
