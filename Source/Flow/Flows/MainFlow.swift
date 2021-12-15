//
//  MainVC.swift
//  TopTabbarTest
//
//  Created by baegteun on 2021/12/02.
//  Copyright © 2021 baek. All rights reserved.
//

import UIKit
import RxFlow

final class MainFlow: Flow{
    var root: Presentable{
        return self.rootVC
    }
    
    enum TabIndex: Int{
        case movie = 0
        
    }
    
    let rootVC: UITabBarController = .init()
    private let movieListFlow: MovieListFlow
    
    init(){
        self.movieListFlow = .init(with: .init())
    }
    
    deinit {
        print("\(type(of: self)): \(#function)")
    }
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step.asTestStep else { return .none }
        
        switch step{
        case .mainTabbarIsRequired:
            return coordinateToMainTabbar()
        default:
            return .none
        }
    }
}

// MARK: - Method
private extension MainFlow{
    func coordinateToMainTabbar() -> FlowContributors{
        Flows.use(
            movieListFlow,
            when: .created
        ) { [unowned self] (root1: UINavigationController) in
            let movieImage: UIImage? = UIImage(systemName: "film")
            
            let movieItem = UITabBarItem(title: "Movie", image: movieImage, selectedImage: nil)
            
            root1.tabBarItem = movieItem
            
            self.rootVC.setViewControllers([root1], animated: true)
        }
        return .multiple(flowContributors: [
            .contribute(withNextPresentable: movieListFlow, withNextStepper: movieListFlow.stepper)
        ])
    }
}
