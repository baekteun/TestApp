//
//  StringExt.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation

extension String{
    var replaceTab: String{
        return self.replacingOccurrences(of: "<b>", with: "")
            .replacingOccurrences(of: "</b>", with: "")
    }
    var toURL: URL?{
        return URL(string: self)
    }
}
