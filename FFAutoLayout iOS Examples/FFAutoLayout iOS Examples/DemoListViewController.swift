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
    var cls: AnyClass
}

class DemoListViewController: UITableViewController {

    lazy var exampleList: [ExampleInfo] = {
        return [ExampleInfo(name: "对齐演示1", cls: AlignDemoView1.self),
            ExampleInfo(name: "对齐演示2", cls: AlignDemoView2.self),
            ExampleInfo(name: "动画演示", cls: AnimDemoView.self),
            ExampleInfo(name: "Horizontal Alignment Demo", cls: HorizontalAlignmentDemoView.self),
            ExampleInfo(name: "Vertical Alignment Demo", cls: VerticalAlignmentDemoView.self)
        ]
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "自动布局演示"
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
