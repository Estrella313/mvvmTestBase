//
//  NetworkManager.swift
//  mvvmTestBase
//
//  Created by BRM13259 on 28/06/22.
//

import Foundation

enum NetworkResponse:String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}
struct NetworkManager {
    static let environment : NetworkEnvironment = .production
    static let PokeapiAPIKey = ""
    let router = Router<PokemonApi>()
    func getPokemons(completion: @escaping (Bool, _ pokemon: [Pokemon]?,_ error: String?)->()){
        router.request(.pokedex) { data, response, error in
                
            if error != nil {
                completion(false, nil, "Please check your network connection.")
            }
                
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(false, nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        print(responseData)
                        let jsonData = try JSONSerialization.jsonObject(with: responseData,options: .mutableContainers)
                        print(jsonData)
                        guard let dataV = responseData.parseData(removeString: "null,") else { return }
                        let apiResponse = try JSONDecoder().decode([Pokemon].self, from: dataV)
                            completion(true, apiResponse, nil)
                    } catch {
                        print(error)
                        completion(false, nil, NetworkResponse.unableToDecode.rawValue)
                    }
                case .failure(let networkFailureError):
                    completion(false, nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
