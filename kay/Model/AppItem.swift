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

class AppItem : NSObject {
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
        print(self.identifier)
        let app = NSRunningApplication.runningApplications(withBundleIdentifier: self.identifier)[0]
        if(app.isActive){
            app.hide()
        }else{
            app.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
        }
    }
    
}
