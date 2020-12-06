//
//  UIButton.swift
//  Journal
//
//  Created by Suchwinder Singh on 12/5/20.
//

import Foundation
import UIKit

// To satisfy extending of a native swift class
// create a function to pulsate (by brining closer and further away from screen)
// https://developer.apple.com/documentation/quartzcore/caspringanimation
// the above link was to create this effect
extension UIButton {
    func pulsate(_:UIButton) {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4 // how long it occurs
        pulse.fromValue = 0.88 // start
        pulse.toValue = 1.0 // end
        pulse.autoreverses = true // go in reverse
        pulse.repeatCount = .infinity // can make in to .infinity or any number
        pulse.initialVelocity = 1 // speed
        layer.add(pulse, forKey: nil) // actually add the effect I believe: https://developer.apple.com/documentation/quartzcore/calayer/1410848-add ,  https://developer.apple.com/documentation/uikit/uiview/1622436-layer
    }
}
