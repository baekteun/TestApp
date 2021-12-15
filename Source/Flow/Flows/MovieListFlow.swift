//
//  MovieListFlow.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import RxFlow
import RxRelay

struct MovieListStepper: Stepper{
    let steps: PublishRelay<Step> = .init()
    
    var initialStep: Step{
        return TestStep.movieListIsRequired
    }
}

final class MovieListFlow: Flow{
    
    // MARK: - Properties
    
    var root: Presentable{
        return self.rootVC
    }
    
    let stepper: MovieListStepper
    private let rootVC = UINavigationController()
    
    // MARK: - Init
    
    init(
        with stepper: MovieListStepper
    ){
        self.stepper = stepper
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    // MARK: - Navigate
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asTestStep else { return .none }
        switch step{
        case .movieListIsRequired:
            return coordinateToMovieList()
        default:
            return .none
        }
    }
}

// MARK: - Method

private extension MovieListFlow{
    func coordinateToMovieList() -> FlowContributors{
        let reactor = MovieListReactor()
        let vc = MovieListVC(reactor: reactor)
        self.rootVC.setViewControllers([vc], animated: true)
        return .one(flowContributor: .contribute(withNextPresentable: vc, withNextStepper: reactor))
    }
}
