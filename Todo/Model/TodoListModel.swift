//
//  TodoList.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import RealmSwift


class TodoList: Object {
    dynamic var name = ""
    dynamic var desc = ""
    let items = List<TodoItem>()
}
