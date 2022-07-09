//
//  PokemonEndPoint.swift
//  mvvmTestBase
//
//  Created by Danya Estrella on 28/06/22.
//

import Foundation
enum NetworkEnvironment {
    case qa
    case production
    case staging
}
public enum PokemonApi {
    case pokemon(id: Int)
    case pokedex
}
extension PokemonApi: EndPointType {
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production: return "https://pokedex-bb36f.firebaseio.com/"
        case .qa: return "https://pokedex-bb36f.firebaseio.com/"
        case .staging: return "https://pokedex-bb36f.firebaseio.com/"
        }
    }
    
    var baseUrl: URL {
        guard let url = URL(string: environmentBaseURL) else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .pokemon(let id):
            return "pokemon/\(id)"
        case .pokedex:
            return "pokemon.json"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .pokemon(let id):
            return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: ["pokemon": id, "api_key":NetworkManager.PokeapiAPIKey])
        default:
            return .request
        }
    }
    var headers: HTTPHeaders? {
            return nil
        }
}
