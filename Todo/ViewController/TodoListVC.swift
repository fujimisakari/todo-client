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

    var items = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = [["name": "fujmoto ryo", "age": "32", "from": "oita"],
                      ["name": "iwagashira yukari", "age": "37", "from": "nagasaki"]]

        Alamofire.request(.GET, "http://localhost:8000/api/todolist")
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
                         print(json["item_list"])
                         print(json["name"].string)
                         print(json["name"].string)
                         // print(json["todolist_list"][0]["description"].string)
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
        let cell = self.tableView.dequeueReusableCellWithIdentifier(Const.todoListCellIdentifier)!
        if let todoListCell = cell as? TodoListViewCell {
            self.configureCell(todoListCell, atIndexPath: indexPath)
        }
        return cell
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        // let con = KINWebBrowserViewController()
        // let URL = NSURL(string: item.link)
        // con.loadURL(URL)
        // self.navigationController?.pushViewController(con, animated: true)
        performSegueWithIdentifier(Const.toTodoItemBySegue, sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == Const.toTodoItemBySegue {
            // SecondViewControllerクラスをインスタンス化してsegue（画面遷移）で値を渡せるようにバンドルする
            // var secondView : SecondViewController = segue.destinationViewController as SecondViewController
            // // secondView（バンドルされた変数）に受け取り用の変数を引数とし_paramを渡す（_paramには渡したい値）
            // // この時SecondViewControllerにて受け取る同型の変数を用意しておかないとエラーになる
            // secondView._second = _param
            print("hoge")
        }
    }

    func configureCell(cell: TodoListViewCell, atIndexPath indexPath: NSIndexPath) {
        // let item = self.items[indexPath.row] as MWFeedItem
        if let item = self.items[indexPath.row] as? Dictionary<String, String> {
            cell.todoListName?.text = item["name"]
            cell.todoListName?.font = UIFont.systemFontOfSize(14.0)
            cell.todoListName?.numberOfLines = 0
            // cell.textLabel?.text = item["name"]
            cell.textLabel?.font = UIFont.systemFontOfSize(14.0)
            cell.textLabel?.numberOfLines = 0
        }

        // let projectURL = item.link.componentsSeparatedByString("?")[0]
        // let imgURL: NSURL? = NSURL(string: projectURL + "/cover_image?style=200x200#")
        // cell.imageView?.contentMode = UIViewContentMode.ScaleAspectFit
        // cell.imageView?.setImageWithURL(imgURL, placeholderImage: UIImage(named: "logo.png"))
    }
}
