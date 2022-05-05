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
        case .low : return "Mwake"
        case .mid : return "Manger"
        case .high : return "Mhappy"
        case .survive : return "Msad"
        case .die : return "Mfull"
        }
    }
    
    var hText: String {
        switch self {
        case .low : return "걱정 없어요!"
        case .mid : return "걱정 되네요."
        case .high : return "무서워요..."
        case .survive : return "휴~ 살았다!"
        case .die : return "GAME OVER"
        }
    }
    
    var mText: String {
        switch self {
        case .low : return "누군가 다가옵니다..."
        case .mid : return "괴물이 다가오고있어요!"
        case .high : return "괴물과 가까워 졌어요!"
        case .survive : return "괴물이 지쳤네요."
        case .die : return "괴물은 배가 부릅니다."
        }
    }
}
