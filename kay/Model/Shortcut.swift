//
//  Shortcut.swift
//  kay
//
//  Created by awmleer on 2018/7/10.
//  Copyright © 2018年 sparker. All rights reserved.
//

import Foundation
import Magnet

class Shortcut: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.keyCombo, forKey: "keyCombo")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.keyCombo = aDecoder.decodeObject(forKey: "keyCombo") as! KeyCombo
    }
    
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
