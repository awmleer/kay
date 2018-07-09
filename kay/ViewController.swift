//
//  ViewController.swift
//  kay
//
//  Created by GuangBo Hao on 2018/3/15.
//  Copyright © 2018年 sparker. All rights reserved.
//


import Cocoa
import Carbon
import MASShortcut
import Magnet

class ViewController: NSViewController {
    
    @objc func testMagnet() {
        print("Magnet!")
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
        for app in applications {
            print("\(app.bundleIdentifier ?? "unknown")  \(app.bundleURL)  \(app.isActive)")
            
        }
        NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
        
        if let keyCombo = KeyCombo(keyCode: 11, carbonModifiers: 4352) {
            let hotKey = HotKey(identifier: "CommandControlB", keyCombo: keyCombo, target: self, action: #selector(ViewController.testMagnet))
            hotKey.register() // or HotKeyCenter.shared.register(with: hotKey)
        }
        
//        let shortcut = MASShortcut.init(
//            keyCode: UInt(kVK_ANSI_H),
//            modifierFlags: UInt(
//                NSEvent.ModifierFlags.command.rawValue +
//                NSEvent.ModifierFlags.shift.rawValue +
//                NSEvent.ModifierFlags.control.rawValue
//            )
//        )
//
//        MASShortcutMonitor.shared().register(shortcut, withAction: {
//            print("Hello world")
//            NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
//        })

        //        NSRunningApplication.runningApplications(withBundleIdentifier: "com.tencent.qq")[0].activate()
        // Do any additional setup after loading the view.
        //        self.apps.append(AppItem())
        //        self.arrayController.content=self.apps
    }
    
    @IBOutlet var arrayController : NSArrayController!
    @IBOutlet weak var appTable: NSScrollView!
    
    class AppItem : NSObject {
        var identifier: String = ""
        @objc dynamic var name: String = ""
        @objc dynamic var shortcut: String = ""
        init(identifier:String, name:String) {
            self.identifier = identifier
            self.name = name
        }
    }
    
    @objc dynamic var apps = [AppItem]()
    
    func addApp(identifier:String, name:String) {
        if identifier == "" {
            return
        }
        for app in apps {
            if(app.identifier == identifier) {
                return
            }
        }
        self.apps.append(AppItem(
            identifier: identifier,
            name: name
        ))
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
            let identifier = bundle!.bundleIdentifier ?? ""
            let name = String(describing: bundle!.infoDictionary?[kCFBundleNameKey! as String] ?? "unknown")
            self.addApp(identifier: identifier, name: name)
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
