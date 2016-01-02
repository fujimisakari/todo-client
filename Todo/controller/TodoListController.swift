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

        // Do any additional setup after loading the view, typically from a nib.
        // let view = UINib(nibName: "SimpleView", bundle: nil).instantiateWithOwner(self, options: nil).first as? UIView

        // self.loadTemplate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // func loadTemplate() {
    //     let view:UIView = UINib(nibName: "SampleView", bundle: nil).instantiateWithOwner(self, options: nil)[0] as! UIView
    //     self.view.addSubview(view)
    // }

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
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
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
    
    func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        let item = self.items[indexPath.row] as! Dictionary<String, String>
        cell.textLabel?.text = item["name"]
        cell.textLabel?.font = UIFont.systemFontOfSize(14.0)
        cell.textLabel?.numberOfLines = 0
        
        // let projectURL = item.link.componentsSeparatedByString("?")[0]
        // let imgURL: NSURL? = NSURL(string: projectURL + "/cover_image?style=200x200#")
        // cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        // cell.imageView?.setImageWithURL(imgURL, placeholderImage: UIImage(named: "logo.png"))
    }
}
