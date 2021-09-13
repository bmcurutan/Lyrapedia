//
//  NSMutableAttributedString+Ext.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/12/21.
//

import UIKit

extension NSMutableAttributedString {
    func setColor(for textToFind: String?, with color: UIColor) {
        let range: NSRange?
        if let text = textToFind{
            range = self.mutableString.range(of: text, options: .caseInsensitive)
        }else{
            range = NSMakeRange(0, self.length)
        }
        if range!.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range!)
        }
    }

    func append(_ string: String) {
        append(NSAttributedString(string: string))
    }
}

