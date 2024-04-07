//
//  Breakpoints.swift
//
//
//  Created by Jiafu Zhang on 4/6/24.
//

import Foundation

enum Breakpoint: CaseIterable {
    case desktop, tablet, mobile
    
    var width: CGFloat {
        switch self {
        case .desktop:
            1440
        case .tablet:
            768
        case .mobile:
            375
        }
    }
    
    init?(width: CGFloat) {
        var breakpoint: Self? = nil
        for b in Self.allCases.reversed() {
            if width >= b.width {
                breakpoint = b
                break
            }
        }
        if let breakpoint {
            self = breakpoint
        } else {
            return nil
        }
    }
}
