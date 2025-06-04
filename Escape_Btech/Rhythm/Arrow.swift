//
//  Arrow.swift
//  Escape_Btech
//
//  Created by Student on 5/27/25.
//

import Foundation
import SwiftUI

struct Arrow: Identifiable {
    let id = UUID()
    var position: CGPoint
    var sequence: [CGFloat]
    var index = 0
    var isEnabled: Bool
    var image: ImageResource
    var grayscale = 1.0
    var opactity = 0.5
}
