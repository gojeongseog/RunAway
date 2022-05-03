//
//  NightFace.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

enum Night: CaseIterable {
    case low
    case mid
    case high
    case survive
    case die
    
    
    var hImageName: String {
        switch self {
        case .low : return "Hhappy"
        case .mid : return "Hnormal"
        case .high : return "Hfear"
        case .survive : return "Hhappy"
        case .die : return "Hdie"
        }
    
    }
    
    var mImageName: String {
        switch self {
        case .low : return "Manger"
        case .mid : return "Mnormal"
        case .high : return "Mhappy"
        case .survive : return "Msad"
        case .die : return "Mfull"
        }
    }
}
