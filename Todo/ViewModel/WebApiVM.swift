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
                 guard let object = response.result.value else {
                     return
                 }

                 let json = JSON(object)
                 json["todolist_list"].forEach { (_, json) in
                     TodoListModel.createData(json)
                 }
                 json["todoitem_list"].forEach { (_, json) in
                     TodoItemModel.createData(json)
                 }
             }
}
