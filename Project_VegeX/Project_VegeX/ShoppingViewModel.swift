//
//  ShoppingViewModel.swift
//  Project_VegeX
//
//  Created by 천지운 on 2020/07/18.
//  Copyright © 2020 Doyoung Song. All rights reserved.
//

import Foundation

enum ShoppingHelpType: Int, CaseIterable {
    case order
    case cancel
    case active
    case helpers
    
    var rowCount: Int {
        switch self {
        case .order: return 1
        case .cancel: return 1
        case .active: return 6
        case .helpers: return 3
        }
    }
}
