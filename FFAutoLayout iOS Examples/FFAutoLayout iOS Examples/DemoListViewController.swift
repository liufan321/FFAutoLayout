//
//  DemoViewController.swift
//  FFAutoLayout
//
//  Created by 刘凡 on 15/6/27.
//  Copyright © 2015年 joyios. All rights reserved.
//

import UIKit

struct ExampleInfo {
    var name: String
    var view: UIView
}

class DemoListViewController: UITableViewController {

    lazy var exampleList: [ExampleInfo] = {
        return [ExampleInfo(name: "Alignment Demo 1", view: AlignDemoView1()),
            ExampleInfo(name: "Alignment Demo 2", view: AlignDemoView2()),
            ExampleInfo(name: "Animation Demo", view: AnimDemoView()),
            ExampleInfo(name: "Horizontal Alignment Demo", view: HorizontalAlignmentDemoView()),
            ExampleInfo(name: "Vertical Alignment Demo", view: VerticalAlignmentDemoView())
        ]
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "FFAutolayout Demo"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.textLabel?.text = exampleList[indexPath.row].name

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let vc = DemoViewController()
        vc.exampleInfo = exampleList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
