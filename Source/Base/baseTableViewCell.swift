//
//  baseTableViewCell.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit

class baseTableViewCell<T>: UITableViewCell{
    var model: T?{
        didSet{
            if let model = model {
                bind(model)
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setLayout()
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addView(){}
    func setLayout(){}
    func configureCell(){}
    func bind(_ model: T){}
}
