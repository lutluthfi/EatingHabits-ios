//
//  RadialGradientView.swift
//  EatingHabits
//
//  Created by Muhammad Faruuq Qayyum on 11/04/20.
//  Copyright © 2020 Triple T. All rights reserved.
//

import UIKit

@IBDesignable
class RadialGradientView: UIView {
    
    @IBInspectable var InsideColor: UIColor = UIColor.clear
    @IBInspectable var OutsiedColor: UIColor = UIColor.clear
    
    override func draw(_ rect: CGRect) {
        let colors = [InsideColor.cgColor, OutsiedColor.cgColor] as CFArray
        let endRadius = min(frame.width, frame.height) / 2
        let centerPoint = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
        
        let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
        
        UIGraphicsGetCurrentContext()!.drawRadialGradient(gradient!, startCenter: centerPoint, startRadius: 0.0, endCenter: centerPoint, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
    }
    
}
