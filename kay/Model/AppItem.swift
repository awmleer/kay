//
//  AppItem.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Foundation
import Cocoa
import Magnet

class AppItem : NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(identifier, forKey: "identifier")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(shortcut, forKey: "shortcut")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.identifier = aDecoder.decodeObject(forKey: "identifier") as! String
        self.name = aDecoder.decodeObject(forKey: "name") as! String
        self.shortcut = aDecoder.decodeObject(forKey: "shortcut") as? Shortcut
    }
    
    var identifier: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var shortcut: Shortcut? = nil
    var hotKey: HotKey? = nil
    
    override init() {
        
    }
    
    init(shortcut: Shortcut) {
        self.shortcut = shortcut
    }
    
    init(identifier: String, name: String) {
        self.identifier = identifier
        self.name = name
    }
    
    func registerHotKey() {
        let hotKey = HotKey(identifier: self.identifier, keyCombo: (self.shortcut?.keyCombo)!, target: self, action: #selector(AppItem.toggle))
        hotKey.register() // or HotKeyCenter.shared.register(with: hotKey)
        self.hotKey = hotKey
    }
    
    func unregisterHotKey() {
        self.hotKey?.unregister()
    }
    
    func reregisterHotKey() {
        self.unregisterHotKey()
        self.registerHotKey()
    }
    
    @objc func toggle() {
        let apps = NSRunningApplication.runningApplications(withBundleIdentifier: self.identifier)
        if apps.isEmpty {
            NSWorkspace.shared.launchApplication(self.name)
//            NSWorkspace.shared.launchApplication(withBundleIdentifier: self.identifier, options: [])
        } else {
            let app = apps[0]
            if (app.isActive) {
                app.hide()
            } else {
                app.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
            }
        }
    }
}
