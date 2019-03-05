//
//  AddAppViewController.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Cocoa
import KeyHolder
import Magnet

class AddAppViewController: NSViewController {

    @IBOutlet weak var CancelButton: NSButton!
    
    @IBOutlet weak var recordView: RecordView!
    
    @objc dynamic var appItem: AppItem = AppItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
//        let keyCombo = KeyCombo(keyCode: 11, cocoaModifiers: NSEvent.ModifierFlags.shift)
//        self.recordView.keyCombo = keyCombo
    }
    
    @IBAction func ButtonChooseAppClicked(_ sender: Any) {
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
            appItem.identifier = bundle!.bundleIdentifier!
//            appItem.identifier = bundle!.bundleIdentifier ?? ""
            appItem.name = String(describing: bundle!.infoDictionary?[kCFBundleNameKey! as String] ?? "unknown")
        } else {
            return
        }
    }
    
    @IBAction func ButtonAddClicked(_ sender: Any) {
        let parent = self.view.window?.sheetParent?.contentViewController as! MainViewController
        self.appItem.shortcut = Shortcut(keyCombo: self.recordView.keyCombo!)
        parent.addApp(appItem: self.appItem)
        self.endSheet()
    }
    
    @IBAction func ButtonCancelClicked(_ sender: Any) {
        self.endSheet()
    }
    
    func endSheet() {
        self.view.window?.sheetParent?.endSheet(self.view.window!)
    }
}
