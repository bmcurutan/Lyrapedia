//
//  UIColor+Ext.swift
//  Lyrapedia
//
//  Created by Bianca Curutan on 9/12/21.
//

import UIKit

// https://digitalsynopsis.com/wp-content/uploads/2019/11/color-schemes-palettes-2.png
extension UIColor {
    static var backgroundColor: UIColor {
        return UIColor(red: 250/255, green: 250/255, blue: 250/255, alpha: 1.0) // FAFAFA Very light gray // TODO dark mode
    }

//    static var tooltipBackgroundColor: UIColor {
//        return UIColor(red: 0, green: 0, blue: 0, alpha: 0.8) // Black with alpha
//    }
//
//    static var borderColor: UIColor {
//        return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0) // DCDCDC Light gray
//    }

    static var accentColor: UIColor {
        return UIColor(red: 248/255, green: 99/255, blue: 81/255, alpha: 1.0) // #f86351 orange
    }

    static var lightAccentColor: UIColor {
        return UIColor(red: 251/255, green: 164/255, blue: 101/255, alpha: 1.0) // #fba465 Light orange
    }

    static var darkAccentColor: UIColor {
        return UIColor(red: 209/255, green: 25/255, blue: 62/255, alpha: 1.0) // #d1193e dark red
    }

    static var primaryTextColor: UIColor {
        return UIColor(red: 58/255, green: 7/255, blue: 81/255, alpha: 1.0) // #3a0751 Dark purple
    }

//    static var secondaryTextColor: UIColor {
//        return UIColor.lightGray
//    }
//
    static var primaryButtonColor: UIColor {
        return UIColor(red: 238/255, green: 62/255, blue: 56/255, alpha: 1.0) // #ee3e38 orange-red
    }

//    static var highlightColor: UIColor {
//        return UIColor(red: 233/255, green: 196/255, blue: 106/255, alpha: 1.0) // #E9C46A Yellow
//    }
}
