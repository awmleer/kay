//
//  Shortcut.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Foundation
import Magnet

class Shortcut: NSObject {
    var keyCombo: KeyCombo!
    @objc dynamic var text: String {
        var ret: String = ""
        for modifier in KeyTransformer.modifiersToString(keyCombo.modifiers) {
            ret += modifier
        }
        ret += keyCombo.characters
        return ret
    }
    
    init(keyCombo: KeyCombo) {
        self.keyCombo = keyCombo
    }
}
