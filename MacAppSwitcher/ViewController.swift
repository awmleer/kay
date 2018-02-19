//
//  ViewController.swift
//  MacAppSwitcher
//
//  Created by GuangBo Hao on 2018/2/19.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var arrayController : NSArrayController!
    @IBOutlet weak var appTable: NSScrollView!
    
    class AppItem : NSObject {
        @objc dynamic var name : String = "test"
        @objc dynamic var shortcut: String = "xxx"
    }
    
    @objc dynamic var apps = [AppItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nsWorkspace = NSWorkspace()
        let applications = nsWorkspace.runningApplications
        print(applications.count)
        for app in applications{
            print("\(app.bundleIdentifier ?? "unknown")  \(app.isActive)")
        }
//        NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
        // Do any additional setup after loading the view.
        self.apps.append(AppItem())
//        self.arrayController.content=self.apps
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        print("ok")
        
        let result = NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/QQ.app"))
        print(result)
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

