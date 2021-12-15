//
//  MovieListCell.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import Kingfisher

final class MovieListCell: baseTableViewCell<Movie>{
   
    // MARK: - Properties
    
    static let identifier = "MovieListCell"
    
    private let movieImageView = UIImageView()
    
    private let movieTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 24)
    }
    
    private let ratingLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
    }
    
    private let subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
    }
    
    // MARK: - UI
    
    override func addView() {
        [movieImageView, movieTitleLabel, ratingLabel, subTitleLabel].forEach{ addSubview($0) }
    }
    override func setLayout() {
        movieImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.equalToSuperview().inset(2)
            $0.width.equalTo(56)
            $0.leading.equalToSuperview()
        }
        ratingLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(5)
        }
        movieTitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(movieImageView.snp.trailing).offset(15)
            $0.trailing.lessThanOrEqualTo(ratingLabel.snp.leading).inset(10)
        }
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(movieTitleLabel.snp.bottom)
            $0.leading.equalTo(movieTitleLabel)
        }
        
    }
    
    override func bind(_ model: Movie) {
        movieImageView.kf.setImage(with: model.image.toURL ?? .none,
                                   placeholder: .none,
                                   options: [.cacheMemoryOnly])
        
        movieTitleLabel.text = model.title.replaceTab
        
        subTitleLabel.text = model.subtitle.replaceTab

        ratingLabel.text = "Rating : \(model.userRating)"
    }
    
    
}
