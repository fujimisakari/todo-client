//
//  WebApiVM.swift
//  Todo
//
//  Created by fujimisakari on 4/17/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import SwiftTask


func syncWithServer() {
    Alamofire.request(.GET, "http://localhost:8000/api/sync")
             .responseJSON { response in
                 // print(response.request)  // original URL request
                 // print(response.response) // URL response
                 // print(response.data)     // server data
                 // print(response.result)   // result of response serialization
                 // if let result_json = response.result.value {
                 //     print("JSON: \(result_json)")
                 // }

                 guard let json = response.result.value as? Dictionary<String, Array<AnyObject>> else {
                     return
                 }

                 json["todolist_list"]?.forEach { todoList in
                     if let jsonDict = todoList as? Dictionary<String, AnyObject> {
                        TodoListModel.createData(jsonDict)
                     }
                 }
                 json["todoitem_list"]?.forEach { todoItem in
                     if let jsonDict = todoItem as? Dictionary<String, AnyObject> {
                        TodoItemModel.createData(jsonDict)
                     }
                 }
             }
}
