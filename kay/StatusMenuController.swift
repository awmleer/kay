//
//  StatusMenuController.swift
//  kay
//
//  Created by awmleer on 2019/3/4.
//  Copyright © 2019 sparker. All rights reserved.
//

import Cocoa

class StatusMenuController: NSViewController {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    override func awakeFromNib() {
        let icon = NSImage(named: NSImage.Name(rawValue: "StatusIcon"))
        icon?.isTemplate = true // best for dark mode
        statusItem.image = icon
        statusItem.menu = statusMenu
    }
    
//    @IBAction func quitClicked(sender: NSMenuItem) {
//        NSApplication.shared.terminate(self)
//    }
}
