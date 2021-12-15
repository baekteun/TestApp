//
//  StepEx.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/12.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow

extension Step{
    var asTestStep: TestStep?{
        return self as? TestStep
    }
}
