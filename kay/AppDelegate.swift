//
//  AppDelegate.swift
//  kay
//
//  Created by GuangBo Hao on 2018/3/15.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Cocoa
import LaunchAtLogin

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var statusMenu: NSMenu!
    @IBOutlet weak var launchAtLoginItem: NSMenuItem!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    let windowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "Main Window Controller") as! NSWindowController
    
    @IBAction func onSettingsClick(_ sender: NSMenuItem) {
        windowController.showWindow(self)
        windowController.window?.makeKey()
        windowController.window?.makeMain()
        windowController.window?.makeKeyAndOrderFront(self)
        NSApplication.shared.activate(ignoringOtherApps: true)
    }
    
    @IBAction func onStartAtLoginClick(_ sender: NSMenuItem) {
        if (launchAtLoginItem.state == NSControl.StateValue.off) {
            LaunchAtLogin.isEnabled = true
            launchAtLoginItem.state = NSControl.StateValue.on
        } else {
            LaunchAtLogin.isEnabled = false
            launchAtLoginItem.state = NSControl.StateValue.off
        }
    }
    
    
    @IBAction func onQuitClick(_ sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
//        let icon = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
//        icon?.isTemplate = true // best for dark mode
//        statusItem.image = icon
        statusItem.title = "K"
        statusItem.menu = statusMenu
        launchAtLoginItem.state = LaunchAtLogin.isEnabled ? NSControl.StateValue.on : NSControl.StateValue.off
        // Insert code here to initialize your application
//        let icon = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
//        icon?.isTemplate = true // best for dark mode
//        NSStatusItem.image = icon
//        NSStatusItem.menu = statusMenu
        
//        debugPrint(LaunchAtLogin.isEnabled)
//        LaunchAtLogin.isEnabled = true
//        debugPrint(LaunchAtLogin.isEnabled)
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

