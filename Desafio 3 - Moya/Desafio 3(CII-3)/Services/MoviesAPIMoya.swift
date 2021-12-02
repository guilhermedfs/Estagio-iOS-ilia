//
//  MoviesApiMoya.swift
//  Desafio 3(CII-3)
//
//  Created by Guilherme Silva on 01/12/21.
//

import Foundation
import Moya

enum MovieAPI {
    case upcomingMovies(page: Int)
    case popularMovies(page: Int)
    case imageLink(imageLink: String)
}

extension MovieAPI: TargetType {
    
    var API_KEY: String {
            return "0d959db44c2b30eb348d0dc5be5cc1ad"
    }
    
    var baseURL: URL {
        switch self {
        case .upcomingMovies:
            return URL(string: "https://api.themoviedb.org/3/movie/upcoming")!
        case .popularMovies:
            return URL(string: "https://api.themoviedb.org/3/movie/popular")!
        case .imageLink(let link):
            return URL(string: "https://image.tmdb.org/t/p/w342\(link)")!
        }
    }
    
    var path: String {
        return ""
    }
    
    var method: Moya.Method {
        switch self {
        case .upcomingMovies:
            return .get
        case .popularMovies:
            return .get
        case .imageLink:
            return .get
        }
    }
        
    var sampleData: Data {
        switch self {
        case .upcomingMovies(page: _):
            return Bundle.loadJSONFromBundle(bundle: Bundle.main, resourceName: "Resources/movies")
        default:
            return Data()
        }
    }
    
    var task: Task {
        return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
    }
    
    var parameters: [String : Any] {
        switch self {
        case .upcomingMovies(let page):
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            parameters["language"] = "pt-BR"
            parameters["page"] = "\(page)"
            return parameters
        case .popularMovies(let page):
            var parameters = [String:Any]()
            parameters["api_key"] = API_KEY
            parameters["language"] = "pt-BR"
            parameters["page"] = "\(page)"
            return parameters
        case .imageLink(imageLink: _):
            var parameters = [String:Any]()
            parameters[""] = ""
            return parameters
        }
    }
    
    
    var headers: [String : String]? {
        return nil
    }
}


