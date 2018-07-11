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
    
    @IBAction func ButtonAddClicked(_ sender: Any) {
        let parentController = self.view.window?.sheetParent?.contentViewController as! MainViewController
        parentController.addApp(identifier: "test.com", name: "test")
        self.endSheet()
    }
    
    @IBAction func ButtonCancelClicked(_ sender: Any) {
        self.testData = "2"
        self.endSheet()
    }
    
    func endSheet() {
        self.view.window?.sheetParent?.endSheet(self.view.window!)
    }
}
