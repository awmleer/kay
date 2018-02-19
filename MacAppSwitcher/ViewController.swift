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
            print("\(app.bundleIdentifier ?? "unknown")  \(app.bundleURL)  \(app.isActive)")
            
        }
//        NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
        // Do any additional setup after loading the view.
        self.apps.append(AppItem())
//        self.arrayController.content=self.apps
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        print("ok")
        let dialog = NSOpenPanel();
        
        dialog.title                   = "Choose a .app file";
        dialog.showsResizeIndicator    = true;
        dialog.showsHiddenFiles        = false;
        dialog.canChooseDirectories    = true;
        dialog.canCreateDirectories    = true;
        dialog.allowsMultipleSelection = false;
        dialog.allowedFileTypes        = ["app"];
        
        if (dialog.runModal() == NSApplication.ModalResponse.OK && dialog.url != nil) {
            let path = dialog.url!.path
            print(path)
            let bundle = Bundle(path: path)
            print(bundle!.bundleIdentifier ?? "")
            print(bundle!.infoDictionary?[kCFBundleNameKey! as String] ?? "unknown")
        } else {
            return
        }
//        let result = NSWorkspace.shared.open(URL(fileURLWithPath: "/Applications/QQ.app"))
//        print(result)
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

