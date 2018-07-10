//
//  AppItem.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Foundation
import Cocoa

class AppItem : NSObject {
    var identifier: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var shortcut: String = ""
    
    init(identifier:String, name:String) {
        self.identifier = identifier
        self.name = name
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
