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



    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationDidBecomeActive(_ notification: Notification) {
        if !NSApplication.shared.windows.isEmpty {
            let window = NSApplication.shared.windows[0]
            window.windowController?.showWindow(self)
        }
    }


}

