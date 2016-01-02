//
//  TodoListController.swift
//  Todo
//
//  Created by fujimisakari on 12/30/15.
//  Copyright © 2015 fujimisakari. All rights reserved.
//

import UIKit

class TodoListController: UITableViewController {

    var items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = [["name": "fujmoto ryo", "age": "32", "from": "oita"],
                      ["name": "iwagashira yukari", "age": "37", "from": "nagasaki"]]
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
        let cell = self.tableView.dequeueReusableCellWithIdentifier(Const.todoListCellIdentifier) as! TodoListCell
        self.configureCell(cell, atIndexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        // let con = KINWebBrowserViewController()
        // let URL = NSURL(string: item.link)
        // con.loadURL(URL)
        // self.navigationController?.pushViewController(con, animated: true)
    }
    
    func configureCell(cell: TodoListCell, atIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        let item = self.items[indexPath.row] as! Dictionary<String, String>
        cell.todoListName?.text = item["name"]
        cell.todoListName?.font = UIFont.systemFontOfSize(14.0)
        cell.todoListName?.numberOfLines = 0
        // cell.textLabel?.text = item["name"]
        cell.textLabel?.font = UIFont.systemFontOfSize(14.0)
        cell.textLabel?.numberOfLines = 0
        
        // let projectURL = item.link.componentsSeparatedByString("?")[0]
        // let imgURL: NSURL? = NSURL(string: projectURL + "/cover_image?style=200x200#")
        // cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        // cell.imageView?.setImageWithURL(imgURL, placeholderImage: UIImage(named: "logo.png"))
    }
}
