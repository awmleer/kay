//
//  AddAppViewController.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Cocoa

class AddAppViewController: NSViewController {

    @IBOutlet weak var CancelButton: NSButton!
    
    var testData: String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func CancelButtonClicked(_ sender: Any) {
        print("cancel")
        self.testData = "2"
        NSApplication.shared.stopModal()
    }
}
