//
//  MovieAPI.swift
//  TestApp
//
//  Created by 최형우 on 2021/12/15.
//  Copyright © 2021 baegteun. All rights reserved.
//

import Moya

enum MovieAPI{
    case getMovies(String)
}

extension MovieAPI: TargetType{
    var baseURL: URL {
        return URL(string: "https://openapi.naver.com")!
    }
    
    var path: String {
        switch self{
        case .getMovies:
            return "/v1/search/movie"
        }
    }
    
    var method: Method {
        switch self{
        case .getMovies:
            return .get
        }
    }
    
    var task: Task {
        switch self{
        case let .getMovies(query):
            return .requestParameters(parameters: ["query" : query],
                                      encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return [
            "X-Naver-Client-Id" : ProcessInfo.processInfo.environment["X-Naver-Client-Id"]!,
            "X-Naver-Client-Secret" : ProcessInfo.processInfo.environment["X-Naver-Client-Secret"]!
        ]
    }
    
    
}
