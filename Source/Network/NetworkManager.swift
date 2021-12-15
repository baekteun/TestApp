//
//  NetworkManager.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Moya
import RxSwift

protocol NetworkManagerType: class{
    func getMovies(query: String) -> Observable<Response>
    
    var provider: MoyaProvider<MovieAPI> { get }
}

final class NetworkManager: NetworkManagerType{
    var provider: MoyaProvider<MovieAPI> = .init()
    
    static let shared = NetworkManager()
    
    func getMovies(query: String) -> Observable<Response> {
        return provider.rx.request(.getMovies(query), callbackQueue: .main).asObservable()
    }
}
