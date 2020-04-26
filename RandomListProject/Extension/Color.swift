//
//  Color.swift
//  RandomListProject
//
//  Created by Jagoth Jyoti Dey on 23.04.20.
//  Copyright © 2020 Jagoth. All rights reserved.
//

import Foundation
import SwiftUI

class ColorExtension {
    static func getBackgroundColor(colorID : Int) -> Color{
        let colors : [Color] = [Color.yellow.opacity(0.7), Color.red.opacity(0.7), Color.blue.opacity(0.8), Color.gray, Color.purple.opacity(0.7), Color.green.opacity(0.6)]
        
        return colors[colorID / 2]
    }
}
