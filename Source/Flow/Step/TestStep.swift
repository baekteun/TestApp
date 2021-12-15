//
//  TestStep.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/12.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

enum TestStep: Step{
    // Global
    case alert(title: String?, message: String?)
    case dismiss
    
    // Main
    case mainTabbarIsRequired
    
    case movieListIsRequired
    case movieItemPicked(withID: String)
    
    
}
