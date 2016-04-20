//
//  TodoListController.swift
//  Todo
//
//  Created by fujimisakari on 12/30/15.
//  Copyright © 2015 fujimisakari. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import RealmSwift


class TodoListController: UITableViewController {

    var items: [TodoListModel] = []
    var selectCell: TodoListModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        try! realm.write {
            for todolist in realm.objects(TodoListModel) {
                self.items.append(todolist)
            }
        }
        syncWithServer()
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
        let cell = self.tableView.dequeueReusableCellWithIdentifier(Const.todoListCellIdentifier)!
        if let todoListCell = cell as? TodoListViewCell {
            self.configureCell(todoListCell, atIndexPath: indexPath)
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.selectCell = self.items[indexPath.row]
        performSegueWithIdentifier(Const.toTodoItemBySegue, sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == Const.toTodoItemBySegue {
            let todoItemController: TodoItemController = segue.destinationViewController as! TodoItemController
            todoItemController.todoListId = self.selectCell.id
        }
    }

    func configureCell(cell: TodoListViewCell, atIndexPath indexPath: NSIndexPath) {
        if let todoList: TodoListModel = self.items[indexPath.row] {
            cell.todoListName?.text = todoList.name
            cell.todoListName?.font = UIFont.systemFontOfSize(14.0)
            cell.todoListName?.numberOfLines = 0
        }
    }
}
