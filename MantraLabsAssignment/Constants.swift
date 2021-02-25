//
//  Constants.swift
//  MantraLabsAssignment
//
//  Created by babita pal on 25/02/21.
//

import Foundation
import UIKit

let COMMON_SUBTITLE_COLOR                 =        colorFromRGB(red: 80, green: 80, blue: 80)

let fontSize16                            =        UIFont(name:"Helvetica-Light", size:16.0)!
let fontSize14                             =        UIFont(name:"Helvetica-Light", size:14.0)!
let semiBoldFontSize16                    =        UIFont(name: "Helvetica", size: 16.0)!

func colorFromRGB(red:CGFloat, green:CGFloat, blue:CGFloat) -> UIColor {
    let color: UIColor = UIColor( red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: CGFloat(1.0) )
    return color
}
