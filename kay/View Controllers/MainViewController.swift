//
//  ViewController.swift
//  kay
//
//  Created by GuangBo Hao on 2018/3/15.
//  Copyright © 2018年 sparker. All rights reserved.
//


import Cocoa
import Magnet

class MainViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let nsWorkspace = NSWorkspace()
//        let applications = nsWorkspace.runningApplications
//        print(applications.count)
//        for app in applications {
//            print("\(app.bundleIdentifier ?? "unknown")  \(app.bundleURL)  \(app.isActive)")
//        }
        if let data = UserDefaults.standard.object(forKey: "apps") as? Data {
            self.apps = NSKeyedUnarchiver.unarchiveObject(with: data) as! [AppItem]
            for app in self.apps {
                app.reregisterHotKey()
            }
            print(self.apps.count)
        }
        print("main view controller loaded")
    }
    
    @IBOutlet var arrayController : NSArrayController!
    @IBOutlet weak var appTable: NSScrollView!
    
    @objc dynamic var apps = [AppItem]()
    
    func addApp(appItem: AppItem) {
        for app in apps {
            if(app.identifier == appItem.identifier) {
                return
            }
        }
        print(appItem.identifier)
        self.apps.append(appItem)
        appItem.registerHotKey()
        
        //save apps to UserDefaults
        let userDefaults = UserDefaults.standard
        let data: Data = NSKeyedArchiver.archivedData(withRootObject: self.apps)
        userDefaults.set(data, forKey:"apps")
        userDefaults.synchronize()
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        let storyboard = NSStoryboard(name: NSStoryboard.Name("Main"), bundle: nil)
        let addAppWindowController = storyboard.instantiateController(withIdentifier: NSStoryboard.SceneIdentifier("Add App Window Controller")) as! NSWindowController
        if let addAppWindow = addAppWindowController.window {
//            let viewController = addAppWindow.contentViewController as! AddAppViewController
            self.view.window?.beginSheet(addAppWindow)
        }
        
        return
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}
