//
//  TodoItemController.swift
//  Todo
//
//  Created by fujimisakari on 1/3/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import UIKit
import RealmSwift

class TodoItemController: UITableViewController {

    var items: [TodoItemModel] = []
    var todoListId: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        try! realm.write {
            for todoItem in realm.objects(TodoItemModel) {
                if todoItem.todoListId == todoListId {
                    self.items.append(todoItem)
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //--------------------------------------------------------------//
    // MARK: - tabledata -
    //--------------------------------------------------------------//
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier(Const.todoItemCellIdentifier)!
        if let todoItemCell = cell as? TodoItemViewCell {
            self.configureCell(todoItemCell, atIndexPath: indexPath)
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    }

    func configureCell(cell: TodoItemViewCell, atIndexPath indexPath: NSIndexPath) {
        if let todoItem: TodoItemModel = self.items[indexPath.row] {
            cell.todoNameLabel?.text = todoItem.text
            cell.todoNameLabel?.font = UIFont.systemFontOfSize(14.0)
            cell.todoNameLabel?.numberOfLines = 0
        }
    }
}
