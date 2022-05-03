//
//  DayFace.swift
//  RunAway
//
//  Created by KoJeongseok on 2022/05/03.
//

import SwiftUI

enum Day: CaseIterable {
    case low
    case mid
    case high
    case die
    
    var hImageName: String {
        switch self {
        case .low : return "Hfear"
        case .mid : return "Hnormal"
        case . high : return "Hhappy"
        case .die : return "Hdie"
        }
    }
}
