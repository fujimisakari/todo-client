//
//  TodoItemController.swift
//  Todo
//
//  Created by fujimisakari on 1/3/16.
//  Copyright © 2016 fujimisakari. All rights reserved.
//

import UIKit

class TodoItemController: UITableViewController {

    var items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = [["name": "python"],
                      ["name": "swift"]]
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
        if let todoItemCell = cell as? TodoItemCell {
            self.configureCell(todoItemCell, atIndexPath: indexPath)
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        // let con = KINWebBrowserViewController()
        // let URL = NSURL(string: item.link)
        // con.loadURL(URL)
        // self.navigationController?.pushViewController(con, animated: true)
    }

    func configureCell(cell: TodoItemCell, atIndexPath indexPath: NSIndexPath) {
        if let item = self.items[indexPath.row] as? Dictionary<String, String> {
            cell.todoNameLabel?.text = item["name"]
            cell.todoNameLabel?.font = UIFont.systemFontOfSize(14.0)
            cell.todoNameLabel?.numberOfLines = 0
        }
    }
}
