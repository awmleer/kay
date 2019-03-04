//
//  AppDelegate.swift
//  kay
//
//  Created by GuangBo Hao on 2018/3/15.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBAction func onQuitClick(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        let icon = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
        // Insert code here to initialize your application
//        let icon = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
//        icon?.isTemplate = true // best for dark mode
//        NSStatusItem.image = icon
//        NSStatusItem.menu = statusMenu
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
//        if !NSApplication.shared.windows.isEmpty {
//            let window = NSApplication.shared.windows[0]
//            window.windowController?.showWindow(self)
//        }
    }


}

