//
//  Shortcut.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Foundation
import Magnet

class Shortcut : Codable {
    var keyCode = 0
    var shift: Bool = false
    var command: Bool = false
    var control: Bool = false
    var option: Bool = false
    func toKeyCombo() -> KeyCombo {
        var modifiers:NSEvent.ModifierFlags = []
        if(self.shift){
            modifiers.insert(NSEvent.ModifierFlags.shift)
        }
        if(self.command){
            modifiers.insert(NSEvent.ModifierFlags.command)
        }
        if(self.control){
            modifiers.insert(NSEvent.ModifierFlags.control)
        }
        if(self.option){
            modifiers.insert(NSEvent.ModifierFlags.option)
        }
        let keyCombo = KeyCombo(keyCode: self.keyCode, cocoaModifiers: modifiers)
        return keyCombo!
    }
}
