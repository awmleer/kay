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
    
    @objc func testMagnet() {
        let app = NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0]
        if(app.isActive){
            app.hide()
        }else{
            app.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nsWorkspace = NSWorkspace()
        let applications = nsWorkspace.runningApplications
        print(applications.count)
//        for app in applications {
//            print("\(app.bundleIdentifier ?? "unknown")  \(app.bundleURL)  \(app.isActive)")
//        }
        
        
//        let app = AppItem(identifier: "com.tencent.qq", name: "QQ")
//        let shortcut = Shortcut()
//        shortcut.keyCode = 11
//        shortcut.shift = true
//        shortcut.command = true
//        app.setShortcut(shortcut: shortcut)
        
        //        NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
        // Do any additional setup after loading the view.
        //        self.apps.append(AppItem())
        //        self.arrayController.content=self.apps
        
//        let shortcut = Shortcut()
//        shortcut.shift = true
//        let userDefaults = UserDefaults.standard
//        if let encoded = try? JSONEncoder().encode(shortcut) {
//            userDefaults.set(encoded, forKey: "test")
//        }
        
//        if let shortcutData = userDefaults.data(forKey: "test"),
//            let shortcut = try? JSONDecoder().decode(Shortcut.self, from: shortcutData) {
//            dump(shortcut)
//        }
        
//        userDefaults.set(shortcut, forKey:"1")
//        userDefaults.synchronize()
//        let s = UserDefaults.standard.object(forKey: "1") as! Shortcut
//        print(s.toIdentifier())
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
//        appItem.registerHotKey() TODO
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
    
    func registerShortcuts() {
        HotKeyCenter.shared.unregisterAll()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}
