//
//  MovieListVC.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import UIKit
import Then
import SnapKit
import RxViewController
import RxSwift

final class MovieListVC: baseVC<MovieListReactor>{
    
    // MARK: - Properties
    
    private let searchBar = UISearchBar()
    
    private let tableView = UITableView().then {
        $0.register(MovieListCell.self, forCellReuseIdentifier: MovieListCell.identifier)
        $0.separatorStyle = .none
        $0.rowHeight = 80
    }
    
    // MARK: - UI
    
    override func addView() {
        [searchBar, tableView].forEach{ view.addSubview($0) }
    }
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }
    override func configureVC() {
        self.navigationItem.titleView = searchBar
    }
    
    // MARK: - Reactor
    
    override func bindView(reactor: MovieListReactor) {
        searchBar.rx.text
            .orEmpty
            .debounce(.milliseconds(700), scheduler: MainScheduler.instance)
            .map { Reactor.Action.fetchMovies($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    
    }
    
    override func bindState(reactor: MovieListReactor) {
        let sharedState = reactor.state.share(replay: 1)
        
        sharedState
            .map { $0.movies }
            .bind(to: tableView.rx.items(
                cellIdentifier: MovieListCell.identifier,
                cellType: MovieListCell.self)
            ) { _, element, cell in
                cell.model = element
            }
            .disposed(by: disposeBag)
    }
}


