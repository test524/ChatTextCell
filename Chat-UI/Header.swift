//
//  Header.swift
//  Chat-UI
//
//  Created by Pavan Kumar Reddy on 22/04/17.
//  Copyright © 2017 Pavan. All rights reserved.
//

import Foundation
import UIKit

let kwidth  = UIScreen.main.bounds.size.width
let blueColor = UIColor(r: 0, g: 137, b: 249)

extension UIColor
{
    convenience init(r: CGFloat, g: CGFloat, b: CGFloat)
    {
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

extension String {
    
    var containsEmoji: Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x1F600...0x1F64F, // Emoticons
            0x1F300...0x1F5FF, // Misc Symbols and Pictographs
            0x1F680...0x1F6FF, // Transport and Map
            0x2600...0x26FF,   // Misc symbols
            0x2700...0x27BF,   // Dingbats
            0xFE00...0xFE0F,   // Variation Selectors
            0x0030...0x0039,
            0x00A9...0x00AE,
            0x203C...0x2049,
            0x2122...0x3299,
            0x1F004...0x1F251,
            0x1F910...0x1F990:  // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
    
}

