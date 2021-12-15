//
//  MovieListReactor.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Foundation
import ReactorKit
import RxFlow
import RxCocoa

final class MovieListReactor: Reactor, Stepper{
    // MARK: - Properties
    var steps: PublishRelay<Step> = .init()
    
    private let disposeBag = DisposeBag()
    
    // MARK: - Reactor
    enum Action{
        case fetchMovies(String)
    }
    enum Mutation{
        case setMovies([Movie])
    }
    struct State{
        var movies: [Movie] = []
    }
    
    var initialState: State = State()
    
}

// MARK: - Mutate

extension MovieListReactor{
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .fetchMovies(query):
            return fetchMovies(query: query)
        }
    }
}

// MARK: - Reduce

extension MovieListReactor{
    func reduce(state: State, mutation: Mutation) -> State {
        var newState = state
        switch mutation {
        case let .setMovies(movies):
            newState.movies = movies
        }
        return newState
    }
}


// MARK: - Method

private extension MovieListReactor{
    func fetchMovies(query: String) -> Observable<Mutation>{
        return NetworkManager.shared.getMovies(query: query)
            .filterSuccessfulStatusCodes()
            .map(MovieResponse.self)
            .map{ $0.items}
            .map { .setMovies($0) }
    }
}
