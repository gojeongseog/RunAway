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
    
    var hText: String {
        switch self {
        case .low : return "무서워요 도망가요..."
        case .mid : return "좀더 걸어 볼까요?"
        case .high : return "잘했어요! "
        case .die : return "GAME OVER"
        }
    }
}
